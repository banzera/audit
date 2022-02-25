class UpdateNilPricesToZero < ActiveRecord::Migration[6.1]
  def up
    connection.exec_update <<~SQL
      update tblorderitems    set orderdeliveredquant=0    where orderdeliveredquant isnull;
    SQL

    connection.exec_update <<~SQL
      update tblorderitems    set orderpriceper=0          where orderpriceper isnull;
    SQL
    connection.exec_update <<~SQL
      update tblorderitems    set orderpricetotal=0        where orderpricetotal isnull;
    SQL
    connection.exec_update <<~SQL
      update tblorderitems    set ordertaxtotal=0          where ordertaxtotal isnull;
    SQL
    connection.exec_update <<~SQL
      update tblorderitems    set orderdeliverycosttotal=0 where orderdeliverycosttotal isnull;
    SQL
    connection.exec_update <<~SQL
      update tblorderitems    set orderfeestotal=0         where orderfeestotal isnull;
    SQL
    connection.exec_update <<~SQL
      update tblorderitems    set ordergrandtotal=0        where ordergrandtotal isnull;
    SQL
    connection.exec_update <<~SQL
      update tblorderitems    set orderretailtotal=0       where orderretailtotal isnull;
    SQL

    connection.exec_update <<~SQL
      update tblorder         set orderpaymentamount=0     where orderpaymentamount isnull;
    SQL

    connection.exec_update <<~SQL
      update tblpurchaseorder set poamountpaid=0           where poamountpaid isnull;
    SQL
  end

  def down
  end
end
