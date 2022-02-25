class SetVariousTableDefaultValues < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tblorderitems, :orderdeliveredquant, from: nil, to: 0

    change_column_default :tblorderitems, :orderpriceper,          from: nil, to: 0
    change_column_default :tblorderitems, :orderpricetotal,        from: nil, to: 0
    change_column_default :tblorderitems, :ordertaxtotal,          from: nil, to: 0
    change_column_default :tblorderitems, :orderdeliverycosttotal, from: nil, to: 0
    change_column_default :tblorderitems, :orderfeestotal,         from: nil, to: 0
    change_column_default :tblorderitems, :ordergrandtotal,        from: nil, to: 0
    change_column_default :tblorderitems, :orderretailtotal,       from: nil, to: 0

    change_column_default :tblorder, :orderpaymentamount, from: nil, to: 0

    change_column_default :tblpurchaseorder, :poamountpaid, from: nil, to: 0
  end
end
