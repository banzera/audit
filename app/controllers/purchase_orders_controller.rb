class PurchaseOrdersController < ApplicationController
  include Effective::CrudController

  load_and_authorize_resource

  def receive
    @datatable = PurchaseOrderItemsDatatable.new(po: @purchase_order)
    @datatable.effective_resource = Effective::Resource.new(PurchaseOrderItem)
  end

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
