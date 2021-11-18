class VendorsController < ApplicationController
  include Effective::CrudController

  def vendor_params
    params.require(:vendor).permit([
      :vendorname,
      :vendorabbr,
    ])
  end

end
