class SkusController < ApplicationController
  include Effective::CrudController

  def sku_params
    params.require(:sku).permit([
      :sku,
      :manf,
      :itemno,
      :skudesc,
      :unitweight,
      :categoryid,
      :skuminunits, :skuminunitstype,
      :dcloc,
      :skuminpercs,
      :vno01, :vsku01, :vhl01,
      :vno02, :vsku02, :vhl02,
      :vno03, :vsku03, :vhl03,
      :vno04, :vsku04, :vhl04,
      :vno05, :vsku05, :vhl05,
      :vno06, :vsku06, :vhl06,
      :vno07, :vsku07, :vhl07,
      :vno08, :vsku08, :vhl08,
      :vno09, :vsku09, :vhl09,
      :vno10, :vsku10, :vhl10,
      :skuhighprice, :skuhighpricevno, :skuhighpricedate,
      :skuclassid,
      :skumaxtemp, :skumintemp,
      :skunotes,
    ])
  end

end
