# frozen_string_literal: true

class BinLabelComponent < ViewComponent::Base
  def initialize(sku:, po:)
    @sku = sku
    @po = po
  end

  WIDTH            = 288.0 # 101.6000 MM = 288.0 PT
  HEIGHT           = 166.5 #  58.7375 MM = 166.5 PT

  TOP_MARGIN    = 1
  BOTTOM_MARGIN = 1
  LEFT_MARGIN   = 6
  RIGHT_MARGIN  = 8
  GUTTER        = 3

  XMARGIN = LEFT_MARGIN + RIGHT_MARGIN
  YMARGIN = TOP_MARGIN + BOTTOM_MARGIN

  SKUID_HEIGHT     = 40
  MANF_ITEM_HEIGHT = 30
  DESC_HEIGHT      = 42
  POID_HEIGHT      = 25
  BATCH_HEIGHT     = 10

  HALF_WIDTH = CENTER = (WIDTH - XMARGIN) / 2

  ROW1_TOP = 160
  ROW2_TOP = ROW1_TOP - GUTTER - SKUID_HEIGHT
  ROW3_TOP = ROW2_TOP - GUTTER - MANF_ITEM_HEIGHT
  ROW4_TOP = ROW3_TOP - GUTTER - DESC_HEIGHT
  ROW5_TOP = ROW4_TOP - GUTTER - POID_HEIGHT

  SKU_BARCODE_WIDTH = WIDTH * 0.65
  SKU_ID_WIDTH = WIDTH - XMARGIN - SKU_BARCODE_WIDTH - GUTTER

  LOGO_WIDTH = 50
  POID_WIDTH = 70
  POID_BARCODE_WIDTH = WIDTH - XMARGIN - POID_WIDTH - LOGO_WIDTH - GUTTER

  TEMPS_LABELS_X_POS = 190
  TEMPS_LABELS_WIDTH = 30

  DOCUMENT_OPTIONS = {
      top_margin:    TOP_MARGIN,
      bottom_margin: BOTTOM_MARGIN,
      left_margin:   LEFT_MARGIN,
      right_margin:  RIGHT_MARGIN,
      page_size:     [
        WIDTH,
        HEIGHT
      ]
  }

  def shrink_opts
    {
      overflow:             :shrink_to_fit,
      min_font_size:        8,
      disable_wrap_by_char: true
    }
  end

  def sku_barcode_box
    [ [0, ROW1_TOP], { width: SKU_BARCODE_WIDTH, height: SKUID_HEIGHT } ]
  end

  def skuid_box
    [ [SKU_BARCODE_WIDTH + GUTTER, ROW1_TOP], width: SKU_ID_WIDTH, height: SKUID_HEIGHT ]
  end

  def manf_item_box
    [ [0, ROW2_TOP], width: SKU_BARCODE_WIDTH, height: MANF_ITEM_HEIGHT ]
    {
      at:    [0, ROW2_TOP],
      width: SKU_BARCODE_WIDTH,
      height: MANF_ITEM_HEIGHT,
    }
  end

  def temps_labels_box
    [ [TEMPS_LABELS_X_POS, ROW2_TOP], width: TEMPS_LABELS_WIDTH, height: MANF_ITEM_HEIGHT ]
  end

  def temps_values_box
    [ [TEMPS_LABELS_X_POS + TEMPS_LABELS_WIDTH + GUTTER, ROW2_TOP], width: 40, height: MANF_ITEM_HEIGHT ]
  end

  def desc_box
    {
      at:     [LEFT_MARGIN, ROW3_TOP],
      width:  WIDTH - LEFT_MARGIN - RIGHT_MARGIN,
      height: DESC_HEIGHT
    }
  end

  def logo_box
    [ [0, ROW4_TOP], width: LOGO_WIDTH, height: POID_HEIGHT ]
  end

  def poid_box
    [ [LOGO_WIDTH, ROW4_TOP], width: POID_WIDTH, height: POID_HEIGHT ]
  end

  def poid_barcode_box
    [ [LOGO_WIDTH + POID_WIDTH + GUTTER, ROW4_TOP], width: POID_BARCODE_WIDTH, height: POID_HEIGHT ]
  end

  def batch_box
    [ [0, ROW5_TOP], width: WIDTH - XMARGIN, height: BATCH_HEIGHT ]

  end

end
