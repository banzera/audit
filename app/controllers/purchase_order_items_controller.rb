class PurchaseOrderItemsController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource :purchase_order
  load_and_authorize_resource :purchase_order_item, through: :purchase_order, through_association: :items, shallow: true

  before_action :load_resources, except: [:index, :new]

  page_title only: :new do
    "New #{resource_name.titleize}(s) for PO #{@purchase_order}"
  end

  button :label, false
  button :receive, 'Receive', redirect: -> { receive_purchase_order_item_path(skuid: resource.id) }
  on     :create, redirect: -> { purchase_order_path(resource.purchase_order) }

  def show
    @parent = @purchase_order_item.purchase_order
  end

  def index
    @datatable = PurchaseOrderItemsDatatable.new(po: @purchase_order)
  end

  def label
    @page_title = "Bin Label for #{@sku.sku} / #{@purchase_order.pobatch}"
    render layout: 'pdf/dymo-30256'
  end

  def label_preview
  end

  def print
  end

  def receive
    @datatable = PurchaseOrderItemsDatatable.new(po: @purchase_order)
    @datatable = resource_datatable

    @steps = [].tap do |step|
      step << { key: :qty,    label: 'Qty',          icon: 'grip-horizontal fas' }
      step << { key: :exp,    label: 'Expiration',   icon: 'calendar fas' }
      if @sku.missing_temperature_values?
        step << { key: :temp,   label: 'Temperatures', icon: 'thermometer-half fas' }
      end
      step << { key: :finish, label: 'Finish',       icon: 'angle-double-right fas' }
    end
  end

  def update
    # resource.update permitted_params
    # respond_to do |format|
    #   format.html { redirect_to receive_purchase_order_path(resource.purchase_order) }
    #   format.js { render 'receive' }
    # end
    super
  end

  private

  def load_resources
    @sku = @purchase_order_item.sku
  end

  def purchase_order_item_params
    params.require(:purchase_order_item).permit([
      :poid,
      :skuid,
      :poorderquant,
      :poorderprice,
      :poordertax,
      :poordershipping,
      :poorderfees,
      :poordertotal,
      :poorderpriceper,
      :poordertaxper,
      :poordershippingper,
      :poorderfeesper,
      :poordertotalper,
      :poorderrcvddate,
      :poorderrcvdquant,
      :poorderexpiration,
      :poorderrebatedeadline,
      :poorderrebatesubmitted,
      :poorderrebate,
      :poorderrebatenotes,
      sku_attributes: [
        :id,
        :skumaxtemp,
        :skumintemp,
      ]
    ])
  end
end
