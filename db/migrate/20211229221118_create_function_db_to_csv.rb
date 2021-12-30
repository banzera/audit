class CreateFunctionDbToCsv < ActiveRecord::Migration[6.1]
  def change
    create_function :db_to_csv
  end
end
