class Table < ApplicationRecord
  self.table_name  = 'information_schema.tables'
  self.primary_key = 'table_name'

  CUSTOMER = where(table_name: "tblcustomer").first

  default_scope  -> { where(table_schema: :public) }
  scope :views,  -> { where(table_type: 'VIEW') }
  scope :tables, -> { where(table_type: 'BASE TABLE') }
  scope :legacy, -> { where("table_name ILIKE 'tbl%'") }

  def copy_sql
    "COPY #{table_schema}.#{table_name} TO STDOUT WITH (FORMAT CSV, FORCE_QUOTE *, HEADER);"
  end

  def cnx
    # get the raw PG::Connection instance
    self.class.connection.raw_connection
  end

  def decoder
    @decoder ||= PG::TextDecoder::String.new
  end

  def export_to(file)
    cnx.copy_data(copy_sql, decoder) do
      while row = cnx.get_copy_data
        file.write row
      end
    end
  end

  def to_s
    "#{table_schema}.#{table_name}"
    "AUDIT Tables"
  end

end
