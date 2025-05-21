# monkey patch zippy since we're running on Ruby where File.exists? no longer
# exists 🫠
class Zippy
  def self.create(filename, options_and_entries={}, &b)
    File.unlink(filename) if File.exist?(filename)
    z = new({:filename => filename}.merge(options_and_entries), &b)
    z.close
    z
  end
end

class DbExportService


  def self.export
    Tempfile.create(['export', '.zip']) do |file|
      zip = new.export_to(file)
      yield zip
    end
  end

  def self.export_to(file)
    new.export_to(file)
  end

  def export_to(file)
    Rails.logger.info "creating archive #{file.path}"

    Zippy.create(file) do |zip|
      Table.legacy.each do |t|
        Rails.logger.info "  -> adding #{t.table_name} to archive"
        with_tempfile do |file|
          t.export_to(file) and file.rewind
          zip[t.table_name + ".csv"] = file.read
        end
      end
    end
  end

  private

  def with_tempfile
    Tempfile.open(['export_table', '.csv']) { |tf| yield tf }
  end

  def entry_for(file)
    file.gsub('public.', '')
  end

  def query_exec(path)
    ActiveRecord::Base.connection.execute(query(path))
  end

  def query(path)
    sql = <<~SQL
      SELECT db_to_csv('#{path}');
    SQL
  end

end
