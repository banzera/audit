class PreOrdersController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  def pre_order_params
    params.require(:pre_order).permit([
      :preorderdate,
      :preorderbatch,
      :custid,
      :preordernotes,
      :preordersh1,
      :preordersh2,
      :preordervendorid,
      :orderid,
      :ordercreatedate,
      :preorderanalysisdate,
      :confirmationdate,
      :preordercheck,
      :notes,
    ])
  end

end
