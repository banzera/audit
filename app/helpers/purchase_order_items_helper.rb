module PurchaseOrderItemsHelper

  def invoice_field(local_assigns)
    simple_fields_for @purchase_order,
        wrapper: :vertical_form,
        defaults: { disabled: local_assigns[:readonly],
                    stimulus: {controller: 'price' }
                  } do |ff|
          yield ff
        end
  end
end
