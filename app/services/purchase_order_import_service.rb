class PurchaseOrderImportService < ItemImportService

  TARGET_SHEET = 0
  KEY_FIELD    = :poid
  HEADER_MAP = {
    skuid:              'SKUID',
    poid:               'POID',
    poorderquant:       'POOrderQuant',
    poorderprice:       'POOrderPrice',
    poordertax:         'POOrderTax',
    poordershipping:    'POOrderShipping',
    poordertotal:       'POOrderTotal',
    poorderpriceper:    'POOrderPricePer',
    poordertaxper:      'POOrderTaxPer',
    poordershippingper: 'POOrderShippingPer',
    poordertotalper:    'POOrderTotalPer',
    poorderrebate:      'POOrderRebate',
    poorderrebatenotes: 'POOrderRebateNotes',
  }

end
