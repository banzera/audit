class OrderPaymentItemsController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  def order_payment_item_params
    params.require(:order_payment_item).permit!
  end
end
