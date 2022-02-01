json.items do
  json.array! @sku_po_histories do |po|
    json.id          po.poid
    json.text        po.to_s
    json.result      render partial: 'sku_po_histories/select2/result',    formats: :html, locals: {po: po}
    json.selection   render partial: 'sku_po_histories/select2/selection', formats: :html, locals: {po: po}
  end
end
