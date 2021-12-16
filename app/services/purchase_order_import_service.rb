class PurchaseOrderImportService

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

  def self.for(purchase_order)
    new(purchase_order)
  end

  def initialize(purchase_order)
    @purchase_order = purchase_order
  end

  def import(uploaded_file)
    @file = uploaded_file

    begin
      workbook = Roo::Spreadsheet.open @file.path
    rescue ArgumentError => e
      raise ArgumentError.new('Invalid file type')
    end

    worksheet = workbook.sheet 0
    first_row = worksheet.row_with HEADER_MAP.values
    last_row  = worksheet.last_row

    worksheet.parse(HEADER_MAP).each_with_index do |row, i|
      raise ArgumentError.new(mismatched_error(row[:poid], i)) if row[:poid] != @purchase_order.id
      @purchase_order.items.create(row)
    end

    last_row - first_row
  end

  private

  def mismatched_error(poid, row)
    "Mismatched POID found in file on line #{row}. Expected #{@purchase_order.id}. Found #{poid}"
  end
end
