class SetDefaultOrderItemOrderquant < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tblorderitems, :orderquant, 0
  end
end
