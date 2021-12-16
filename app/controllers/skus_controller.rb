class SkusController < ApplicationController
  include DefaultCrudController
  include Select2Searchable

  load_and_authorize_resource

  submit :receive, 'Receive Items', only: :show, redirect: -> { receive_skus_path(skuid: resource.id) }

  page_title(only: [:index]) { resource_klass.model_name.human(count: 2) }

  def index
    respond_to do |format|
      format.html { super }
      format.json {
        @skus = @skus.search(select2_search_term) if select2_search_term?
        @skus = @skus.limit(10)
      }
    end
  end

  def receive
    @po_items        = PurchaseOrderItem.where(skuid: @sku) #.unfulfilled
    @purchase_orders = PurchaseOrder.where(poid: @po_items.collect(&:poid))
  end

  def lookup
    @datatable = SkuLookupDatatable.new()
    collection_action(:lookup)
  end

  def search
    @query = search_params[:q]
    @datatable = SkuLookupDatatable.new(search: @query)
    render :lookup
  end

  private

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
