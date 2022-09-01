class AddForeignKeysToPurchaseOrder < ActiveRecord::Migration[6.1]
  def change
    # ensure the VOID PO exists so we can create the following constraint
    PurchaseOrder::VOID

    add_foreign_key :tblpreorderitems, :tblpurchaseorder, column: "poid", primary_key: "poid"
  end
end
