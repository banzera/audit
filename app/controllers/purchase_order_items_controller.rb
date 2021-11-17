class PurchaseOrderItemsController < ApplicationController
  include Effective::CrudController

  load_and_authorize_resource

  button :receive, 'Receive', redirect: -> { receive_purchase_order_item_path(skuid: resource.id) }

  def receive

  end

  def update
    binding.pry
    resource.update permitted_params
    redirect_to receive_purchase_order_item_path(resource.id)
  end

  def permitted_params
    params.require(:purchase_order_item).permit([
      :poid,
      :skuid,
      :poorderquant,
      :poorderprice,
      :poordertax,
      :poordershipping,
      :poorderfees,
      :poordertotal,
      :poorderpriceper,
      :poordertaxper,
      :poordershippingper,
      :poorderfeesper,
      :poordertotalper,
      :poorderrcvddate,
      :poorderrcvdquant,
      :poorderexpiration,
      :poorderrebatedeadline,
      :poorderrebatesubmitted,
      :poorderrebate,
      :poorderrebatenotes,
      sku_attributes: [
        :id,
        :skumaxtemp,
        :skumintemp,
      ]


    ])
  end

end
