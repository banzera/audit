class AddSubscriptionAmountToCustomer < ActiveRecord::Migration[6.1]
  def up
    add_column :tblcustomer, :subscription_amount, :integer

    execute <<~SQL
      update tblcustomer set subscription_amount = 199 where billing_mode = 1;
      update tblcustomer set subscription_amount = 499 where billing_mode = 0;
    SQL
  end

  def down
    remove_column :tblcustomer, :subscription_amount, :integer
  end
end
