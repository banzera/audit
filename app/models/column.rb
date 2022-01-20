class Column < ApplicationRecord
  self.table_name  = 'information_schema.columns'
  self.primary_key = 'table_name'

  default_scope  -> { where(table_schema: :public) }

  belongs_to :table, foreign_key: :table_name

  def to_s
    case data_type
    when "timestamp with time zone" then "#{column_name}::date"
    when "boolean"                  then "(case when #{column_name} = 't' then 'Yes' else 'No' end) AS #{column_name}"
    else column_name
    end
  end

end
