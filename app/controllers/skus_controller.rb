class SkusController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  submit :receive, 'Receive Items', only: :show, redirect: -> { receive_skus_path(skuid: resource.id) }

  def receive
    @po_items        = PurchaseOrderItem.where(skuid: @sku) #.unfulfilled
    @purchase_orders = PurchaseOrder.where(poid: @po_items.collect(&:poid))
  end

  def lookup
    @datatable = SkuLookupDatatable.new()
    collection_action(:lookup)
  end

  def search
    @query = search_params[:search]
    @datatable = SkuLookupDatatable.new(search: @query)
    render :lookup
  end

  def search_params
    params.require(:sku).permit(:search)
  end

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
