class SkuClassesController < ApplicationController
  include DefaultCrudController

  def permitted_params
    params.require(:sku_class).permit([
      :skuclassdesc
    ])
  end

end
