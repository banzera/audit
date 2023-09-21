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
  text = "MANF: #{@sku.manf}\nITEM: #{@sku.itemno}"
  pdf.text_box(text, shrink_opts.merge(manf_item_box))

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
  pdf.text_box @sku.skudesc, shrink_opts.merge(desc_box)

  # logo
  pdf.bounding_box(*logo_box) do
    pdf.image Rails.root + "public/img/AC_Icon_LightBG@4x.png", position: :left, vposition: :bottom, height: POID_HEIGHT
  end

  # POID
  pdf.bounding_box(*poid_box) do
    pdf.text @po.poid, size: 26, align: :right
  end

  # POID Barcode
  pdf.bounding_box(*poid_barcode_box) do
    # pdf.svg Barby::Code39.new(@po.poid.to_s).to_svg(margin: 0, height: POID_HEIGHT, xdim: 1)
  end

  # batch
  pdf.bounding_box(*batch_box) do
    pdf.text @po.pobatch, size: 6, align: :center, valign: :center
  end

end
