class PreOrdersController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  button :upload, false
  button :new_items, 'Add or Upload Items'
  button :reseend_confirmation, 'Resend Confirmation Email'

  # def create_order
  #   binding.pry

  #   o = @pre_order.build_order(custid: custid, orderdate: Date.today)
  #   @pre_order.ordercreatedate = Date.today

  # end

  def new_items
    redirect_to new_pre_order_pre_order_item_path(resource)
  end

  def upload
    svc = PreOrderImportService.for(@pre_order)

    if items = svc.import(params[:file])
      render json: {
        message: "Imported #{items.size} items to #{@pre_order}",
           href: pre_order_path(@pre_order)
         }
    else
      render plain: 'Error', status: :unprocessable
    end

  rescue => e
    render plain: "Error: #{e.message}", status: :internal_server_error
  end

  def pre_order_params
    params.require(:pre_order).permit([
      :preorderdate,
      :preorderbatch,
      :custid,
      :preordernotes,
      :preordersh1,
      :preordersh2,
      :preordervendorid,
      :orderid,
      :ordercreatedate,
      :preorderanalysisdate,
      :confirmationdate,
      :preordercheck,
      :notes,
    ])
  end

end
