class PreOrdersController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  before_action :set_pdf_options, only: [:confirmation]

  button :confirmation, false
  button :confirmation_preview, 'Confirmation'

  button :upload, false
  button :new_items, 'Add or Upload Items'
  button :resend_confirmation, false #'Resend Confirmation Email'

  submit :create_order, false
  button :create_order, "Create Order", unless: -> { resource.order.present? }, method: :post, remote: true, 'data-confirm': "REally?"
  submit :order_update, false
  # button :order_update, "Run Order Update", unless: -> { resource.order.blank? }


  def confirmation_preview
    render 'preview'
  end

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

  def set_pdf_options
    @pdf_options['orientation']  = 'Landscape'
    @pdf_options['margin-left']  = '0.3in'
    @pdf_options['margin-right'] = '0.3in'
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
