class RevertOrderpaymentamountDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tblorder, :orderpaymentamount, from: 0.0, to: nil
  end
end
