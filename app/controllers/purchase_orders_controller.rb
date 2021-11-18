class PurchaseOrdersController < ApplicationController
  include Effective::CrudController

  def permitted_params
    params.require(:purchase_order).permit([
      :podate,
      :pobatch,
      :splrid,
      :splrid2,
      :poshipdate,
      :poshiptype,
      :potrackingno,
      :porcvdby,
      :podatepaid,
      :pomethodpaid,
      :popaymentno,
      :poamountpaid,
      :ponotes,
      :posplrorderno,
      :pochecksentdate,
    ])
  end

end
