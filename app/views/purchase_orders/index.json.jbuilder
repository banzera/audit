json.items do
  json.array! @purchase_orders do |po|
    json.id          po.poid
    json.text        po.to_s
    json.result      render partial: 'purchase_orders/select2/result',    formats: :html, locals: {po: po}
    json.selection   render partial: 'purchase_orders/select2/selection', formats: :html, locals: {po: po}
  end
end
