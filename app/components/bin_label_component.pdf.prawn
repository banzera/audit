prawn_document(DOCUMENT_OPTIONS) do |pdf|
  pdf.stroke_axis if Rails.env.development?

  # barcode
  pdf.bounding_box(*sku_barcode_box) do
   pdf.svg Barby::Code39.new(@sku.skuid.to_s).to_svg(margin: 0, height: SKUID_HEIGHT, xdim: 1)
  end

  # skuid
  pdf.bounding_box(*skuid_box) do
   pdf.text @sku.skuid, size: 26
  end

  # manf / item
  pdf.bounding_box(*manf_item_box) do
    pdf.text "MANF: #{@sku.manf}"
    pdf.text "ITEM: #{@sku.itemno.truncate(24)}"
  end

  # temps
  pdf.bounding_box(*temps_labels_box) do
    pdf.text "Max:", align: :right, style: :bold
    pdf.text "Min:", align: :right, style: :bold
  end

  pdf.bounding_box(*temps_values_box) do
    pdf.text @sku.skumaxtemp, align: :left
    pdf.text @sku.skumintemp, align: :left
  end

  # desc
  opts = {
    overflow:             :shrink_to_fit,
    min_font_size:        8,
    disable_wrap_by_char: true
  }.merge desc_box

  pdf.text_box @sku.skudesc, opts

  # logo
  pdf.bounding_box(*logo_box) do
    pdf.image Rails.root + "public/img/logo_black.png", position: :left, vposition: :bottom, height: POID_HEIGHT
  end

  # POID
  pdf.bounding_box(*poid_box) do
    pdf.text @po.poid, size: 26, align: :right
  end

  # POID Barcode
  pdf.bounding_box(*poid_barcode_box) do
    pdf.svg Barby::Code39.new(@po.poid.to_s).to_svg(margin: 0, height: POID_HEIGHT, xdim: 1)
  end

  # batch
  pdf.bounding_box(*batch_box) do
    pdf.text @po.pobatch, size: 6, align: :center, valign: :center
  end

end
