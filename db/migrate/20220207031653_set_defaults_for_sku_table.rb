class SetDefaultsForSkuTable < ActiveRecord::Migration[6.1]
  def change

    change_column_default :tblsku, :skuminpercs, 1
    change_column_default :tblsku, :dcloc, 'N/A'

    change_column_default :tblsku, :skumaxtemp, 0
    change_column_default :tblsku, :skumintemp, 0
    change_column_default :tblsku, :categoryid, 3  # Med Spls (Tax)
  end
end
