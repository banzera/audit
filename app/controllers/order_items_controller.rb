class OrderItemsController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource :order
  load_and_authorize_resource :order_item,
                              through: :order,
                              through_association: :items,
                              shallow: true

  before_action :load_resources, except: [:index]

  on :destroy, redirect: -> { order_path(resource.order) }
  submit :split, 'Split', default: true, only: [:split], redirect: -> { order_path(resource.order) }
  submit :save, 'Save', except: [:split]

  button :split, false

  before_action :duplicate_resource, only: [:split]
  after_error only: [:split]  do
    @order_item.reload
    duplicate_resource
    @order_item.assign_attributes permitted_params
    @order_item.valid?
  end

  def index
    @datatable = OrderItemsDatatable.new(order: @order)
  end

  def duplicate_resource
    @dup = @order_item.duplicate_for_split
  end

  def show
    redirect_to @order_item.order
  end

  private

  def load_resources
    @sku = @order_item.sku
  end

  def order_item_params
    params.require(:order_item).permit!
  end
  alias_method :permitted_params, :order_item_params

end
