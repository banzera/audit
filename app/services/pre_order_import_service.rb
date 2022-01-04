class PreOrderImportService < ItemImportService

  TARGET_SHEET = 0
  KEY_FIELD    = :preorderid
  HEADER_MAP   = {
    preorderid:       'PreOrderID',
    skuid1:           'SKUID1',
    orderquant1:      'OrderQuant1',
    orderpriceper1:   'OrderPricePer1',
    orderpricetotal1: 'OrderPriceTotal1',
  }

end
