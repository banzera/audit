class PurchaseOrdersController < ApplicationController
  include Effective::CrudController

  def permitted_params
    params.require(:purchase_order).permit!
  end

end
