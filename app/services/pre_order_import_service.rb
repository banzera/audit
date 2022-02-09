class PreOrderImportService < ItemImportService

  TARGET_SHEET = 0
  KEY_FIELD    = :preorderid
  HEADER_MAP   = {
    skuid1:           'SKUID1',
    skuid2:           'SKUID2',
    poid:             'POID',
    orderdate:        'ODate',
    preorderitemcode: 'Code',
    orderpriceper1:   'OrderPricePer1',
    orderpriceper2:   'OrderPricePer2',
    orderaupriceper:  'OrderAUPrice2',
    orderquant1:      'OrderQuant1',
    orderquant2:      'OrderQuant2',
    orderpricetotal1: 'OrderPriceTotal1',
    orderpricetotal2: 'OrderPriceTotal2',
    preorderid:       'PreOrderID',
    preordernotes:    'ItemNotes',
    preorderurgent:   'ItemUrgent',
  }

end
