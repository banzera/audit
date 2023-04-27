class InvoiceService

  def self.export(month)
    Tempfile.create(["invoices_#{month}", '.zip']) do |file|
      zip = new.export_to(file)
      yield zip
    end
  end

  def self.export_to(file)
    new.export_to(file)
  end

  def export_to(file)
    Rails.logger.info "creating invoice archive #{file.path}"

    Zippy.create(file) do |zip|
      total = []

      MonthlyInvoiceReport.prev1.no_gen4.each_with_index do |mir, x|
        puts mir.custname
          i = Invoice.new(mir, x, header: x.zero?)
          zip[i.filename] = i.to_csv
          total << i.to_csv
      end

      all = total.join "\n"

      zip['all_invoices.csv'] = all

    end
  end

  private

  class Invoice
    attr_reader :mir, :invoice_number, :header

    def initialize(mir, invoice_number, header: true)
      @mir            = mir
      @invoice_number = invoice_number + 1001
      @header         = header
    end

    def filename
      "invoice_#{mir.customer.custname}_#{mir.month.to_s(:number)}.csv"
    end

    def to_csv
      [
        header_line,
        line1,
        market_price_line,
        savings_line,
        tier1_line,
        tier2_line,
        tier3_line
      ].compact.join "\n"
    end

    def line1
      [
        invoice_number,
        '"' + @mir.customer.custbillingbusinessname + '"',
        Date.today.beginning_of_month,            # invoice date
        Date.today.beginning_of_month + 30,       # due date
        'Net 30',                                 # terms
        '', # 'Location',
        '', # 'Memo',
        '', # 'Item(Product/Service)',
        '', # 'ItemDescription',
        '', # 'ItemQuantity',
        '', # 'ItemRate',
        '', # '*ItemAmount',
        '', # 'Taxable',
        '', # 'TaxRate',
        '', # 'Service Date',
      ].join(',')
    end

    def line_item(product, amt, description: '', service_date: '', qty: 1)
      [
        invoice_number, # *InvoiceNo
        '',          # *Customer
        '',          # *InvoiceDate
        '',          # *DueDate
        '',          # Terms
        '',          # Location
        '',          # Memo
        product,     # Item(Product/Service)
        description, # ItemDescription
        qty,         # ItemQuantity
        amt,         # ItemRate
        amt,         # *ItemAmount
        '',          # Taxable
        '',          # TaxRate
        service_date
      ].join(',')
    end

    def market_price_line
      line_item("Market Price", @mir.current_total,
        description:  "#{@mir.orders.size} order".pluralize(@mir.orders.size),
        service_date: @mir.month.beginning_of_month
      )
    end

    def savings_line
      line_item("Realized Savings", @mir.gross_savings, qty: 1)
    end

    def tier1_line
      line_item("Savings Tier 1", @mir.tier1_amt,
        description: "100% of savings amount up to $499"
      )
    end

    def tier2_line
      line_item("Savings Tier 2", @mir.tier2_amt,
        description: "50% of savings amount between $499 and $1499"
      )
    end

    def tier3_line
      line_item("Savings Tier 3", @mir.tier3_amt,
        description: "10% of savings amount above $1499"
      )
    end

    def header_line
      return nil unless header

      %w(
        InvoiceNo
        Customer
        InvoiceDate
        DueDate
        Terms
        Location
        Memo
        Item(Product/Service)
        ItemDescription
        ItemQuantity
        ItemRate
        *ItemAmount
        Taxable
        TaxRate
        ServiceDate
      ).join(',')
    end
  end
end
