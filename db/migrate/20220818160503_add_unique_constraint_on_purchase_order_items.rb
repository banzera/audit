class AddUniqueConstraintOnPurchaseOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_index(:tblpurchaseorderitems, [:poid, :skuid], unique: true)
  end
end
