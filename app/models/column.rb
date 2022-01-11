class Column < ApplicationRecord
  self.table_name  = 'information_schema.columns'
  self.primary_key = 'table_name'

  default_scope  -> { where(table_schema: :public) }

  belongs_to :table, foreign_key: :table_name

  def to_s
    cast = data_type == "timestamp with time zone" ? '::date' : ''
    "#{column_name}#{cast}"
  end

end
