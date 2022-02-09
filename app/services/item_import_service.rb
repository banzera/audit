class ItemImportService

  def self.for(resource)
    new(resource)
  end
  # end
  def initialize(resource)
    @resource = resource
  end

  def import(uploaded_file, overwrite=true)
    @file = uploaded_file

    begin
      workbook = Roo::Spreadsheet.open @file.path
    rescue ArgumentError => e
      raise ArgumentError.new('Invalid file type')
    end

    worksheet = workbook.sheet(target_sheet)
    begin
      first_row = worksheet.row_with self.class::HEADER_MAP.values
    rescue Roo::HeaderRowNotFoundError
      raise ArgumentError.new("Couldn't locate header row in first sheet #{target_sheet} of workbook. Expecting fields: #{self.class::HEADER_MAP.values}")
    end

    last_row  = worksheet.last_row

    @resource.transaction do
      @resource.items.delete_all if overwrite

      worksheet.parse(self.class::HEADER_MAP).each_with_index do |row, i|

        raise ArgumentError.new(mismatched_error(row[self.class::KEY_FIELD], i)) if row[self.class::KEY_FIELD] != @resource.id

        @resource.items.build(row).save validate: false

      end
    end

    last_row - first_row
  end

  private

  def target_sheet
    self.class::TARGET_SHEET
  end

  def mismatched_error(key_field, row)
    "Mismatched key field value found in file on line #{row}. Expected #{@resource.id}. Found #{key_field}"
  end
end
