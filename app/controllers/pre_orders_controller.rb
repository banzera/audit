class PreOrdersController < ApplicationController
  include DefaultCrudController

  def permitted_params
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
    ])
  end

end
