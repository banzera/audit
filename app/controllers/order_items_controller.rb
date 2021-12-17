class OrderItemsController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource :order
  load_and_authorize_resource :order_item,
                              through: :order,
                              through_association: :items,
                              shallow: true

  before_action :load_resources, except: [:index]

  # button :split, 'Spl'
  # submit :split, 'SS'
  #
  def split

    dup = @order_item.dup
    # dup.purchase_order = nil
    dup.save

    redirect_to edit_order_item_path dup
  end

  def show
    @parent = @order_item.order
  end

  # def update
    # resource.update permitted_params
    # respond_to do |format|
    #   format.html { redirect_to receive_purchase_order_path(resource.purchase_order) }
    #   format.js { render 'receive' }
    # end
  # end

  private

  def load_resources
    @sku = @order_item.sku
  end

  def permitted_params
    params.require(:order_item).permit([
    ])
  end

end
