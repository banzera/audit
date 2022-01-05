class PurchaseOrdersController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  button :upload, false
  button :new_items, 'Add or Upload Items'

  def new_items
    redirect_to new_purchase_order_purchase_order_item_path(resource)
  end

  def receive
    @datatable = PurchaseOrderItemsDatatable.new(po: @purchase_order)
    @datatable.effective_resource = Effective::Resource.new(PurchaseOrderItem)
  end

  def upload
    svc = PurchaseOrderImportService.for(@purchase_order)

    if items = svc.import(params[:file])
      render json: {
        message: "Created PO and imported #{items.size} items",
           href: purchase_order_path(@purchase_order)
         }
    else
      render plain: 'Error', status: :unprocessable
    end

  rescue => e
    render plain: "Error: #{e.message}", status: :internal_server_error
  end

  def purchase_order_params
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
      :invoice_nontax,
      :invoice_tax,
      :invoice_fees,
      :invoice_sh,
      :invoice_subtotal,
      :invoice_total,
    ])
  end

end
