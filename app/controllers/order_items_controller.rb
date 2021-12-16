class OrderItemsController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource
  before_action :load_resources, except: [:index]

  button :split, 'Split'

  def update
    resource.update permitted_params
    respond_to do |format|
      format.html { redirect_to receive_purchase_order_path(resource.purchase_order) }
      format.js { render 'receive' }
    end
  end

  private

  def load_resources
    @order = @order_item.order
    @sku   = @order_item.sku
  end

  def permitted_params
    params.require(:order_item).permit([
    ])
  end

end
