class VendorsController < ApplicationController
  include DefaultCrudController

  def vendor_params
    params.require(:vendor).permit([
      :vendorname,
      :vendorabbr,
    ])
  end

end
