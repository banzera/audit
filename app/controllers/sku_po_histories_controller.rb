class SkuPoHistoriesController < ApplicationController
  include Select2Searchable

  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html { super }
      format.json {
        @sku_po_histories = @sku_po_histories.for_sku(params[:sku]) if params[:sku]
        @sku_po_histories = @sku_po_histories.limit(10)
      }
    end
  end

end
