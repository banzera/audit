class AddBillingModeToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :tblcustomer, :billing_mode, :integer
  end
end
