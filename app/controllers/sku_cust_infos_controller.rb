class SkuCustInfosController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  def sku_cust_info_params
    params.require(:sku_cust_info).permit!
  end
  alias_method :permitted_params, :sku_cust_info_params
end
