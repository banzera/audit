class PreOrderCodesController < ApplicationController
  include DefaultCrudController

  def permitted_params
    params.require(:pre_order_code).permit([
      :preordercode,
      :preordercodedesc,
    ])
  end

end
