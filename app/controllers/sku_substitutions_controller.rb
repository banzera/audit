class SkuSubstitutionsController < ApplicationController
  include DefaultCrudController

  def destroy

  end

  def permitted_params
    params.require(:sku_substitution).permit!
  end

end
