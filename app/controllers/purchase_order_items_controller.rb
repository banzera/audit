class PurchaseOrderItemsController < ApplicationController
  include DefaultCrudController
  include HasLabel

  load_and_authorize_resource :purchase_order
  load_and_authorize_resource :purchase_order_item, through: :purchase_order, through_association: :items, shallow: true

  before_action :load_resources, except: [:index, :new]

  page_title(only: [:new])   { "New #{resource_name.titleize}(s) for PO #{@purchase_order}" }
  page_title(only: [:label]) { "Bin Label for #{@sku.sku} / #{@purchase_order.pobatch}" }

  button :receive, 'Receive', redirect: -> { receive_purchase_order_item_path(skuid: resource.id) }
  submit :receive, 'Receive'
  on     :create, redirect: -> { purchase_order_path(resource.purchase_order) }
  on     :save,   redirect: -> { purchase_order_path(resource.purchase_order) }

  def edit
    @parent = @purchase_order_item.purchase_order
    redirect_to edit_purchase_order_purchase_order_item_path(@parent, @purchase_order_item) unless @purchase_order.present?
  end

  def show
    @parent = @purchase_order_item.purchase_order
  end

  def index
    @datatable = PurchaseOrderItemsDatatable.new(po: @purchase_order)
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

  private

  def load_resources
    @sku = @purchase_order_item.sku
    @purchase_order ||= @purchase_order_item.purchase_order
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
      :poordersplit,
      :poorderissue,
      sku_attributes: [
        :id,
        :skumaxtemp,
        :skumintemp,
      ]
    ])
  end
end
