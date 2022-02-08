class SetDefaultsForOrderItemsTable < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tblorderitems, :orderdeliveredquant, 0
  end
end
