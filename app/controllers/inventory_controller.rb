class InventoryController < ApplicationController
  include Effective::CrudController

  def export
    @items = FaliamInventoryExport.all

    respond_to do |format|
      format.xlsx
    end
  end
end


