class ReceivingController < ApplicationController

 def receive
    @page_title = 'Receive'
    # @count = session[:count].to_i

    # @po = PurchaseOrder.find(params[:poid]) if params[:poid].present?
    #
    @skus = []
  end

end
