json.items do
  json.array! @skus do |sku|
    json.id          sku.skuid
    json.text        sku.sku
    json.result      render partial: 'skus/select2/result',    formats: :html, locals: {sku: sku}
    json.selection   render partial: 'skus/select2/selection', formats: :html, locals: {sku: sku}
  end
end
