class SkusController < ApplicationController
  include Effective::CrudController

  def sku_params
    params.require(:sku).permit!
  end

end
