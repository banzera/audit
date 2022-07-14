class TaxJurisdictionsController < ApplicationController
  include DefaultCrudController

  def permitted_params
    params.require(:tax_jurisdiction).permit([
      :jurisdictioncode,
      :jurisdictionname,
      :rateeffdate,
      :taxrate,
    ])
  end

end
