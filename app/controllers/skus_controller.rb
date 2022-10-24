class SkusController < ApplicationController
  include DefaultCrudController
  include Select2Searchable
  include HasLabel

  load_and_authorize_resource

  submit :receive, 'Receive Items', only: :show, redirect: -> { receive_skus_path(skuid: resource.id) }
  submit :duplicate, 'Duplicate', only: :show, redirect: -> { new_sku_path(duplicate_id: resource.id) }

  button :po_history, "PO History"
  button :export, "Export CSV", path: '/skus.csv'

  buttons['Mark Has Issue'][:if] = ->{ !resource.has_issue? }
  buttons['Resolve Issue'][:if] = -> { resource.has_issue? }

  page_title(only: [:index]) { resource_klass.model_name.human(count: 2) }
  page_title(only: [:label]) { "SKU Location Label for #{@sku}" }

  def index
    respond_to do |format|
      format.html { super }
      format.csv  { send_data SkuExport.to_csv, filename: "skus-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"}
      format.json {
        @skus = @skus.search(select2_search_term) if select2_search_term?
        @skus = @skus.limit(10).to_a.sort
      }
    end
  end

  def with_issues
    @datatable = SkuIssuesDatatable.new
    @dt_opts = {
      buttons:    false,
      pagination: false,
      entries:    false,
    }

    render :index
  end

  def receive
    @purchase_orders = PurchaseOrder.for_sku_id(@sku).order('podate desc')
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

  def po_history
    @sku_po_histories = SkuPoHistory.for_sku(@sku).order(:poid)
    @sku_po_histories = @sku_po_histories.where(poid: select2_search_term) if select2_search_term?
    @sku_po_histories = @sku_po_histories.available_or_in_dc if params[:available_only].present?

    respond_to do |format|
      format.html { }
      format.json {
        @sku_po_histories = @sku_po_histories
        render 'sku_po_histories/index'
      }
    end
  end

  private

  def duplicate_resource(resource)
    resource_klass.new(resource.attributes).tap do|r|
      r.dcloc = Sku::DC_LOC_NONE
      r.valid? # run validators to highlight fields that need to change
    end
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
