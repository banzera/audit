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

      MonthlyInvoiceReport.prev1.savings.each_with_index do |mir, x|
        i = Invoice.new(mir, x + 1001, header: x.zero?)
        zip[i.filename] = i.to_csv
        total << i.to_csv
      end

      all = total.join "\n"

      zip['all_invoices.csv'] = all
    end
  end

  private

  class Invoice
    extend Dry::Initializer

    EMPTY_FIELD = "".freeze

    param :mir
    param :invoice_number
    option :header, default: proc { true }

    def filename
      "invoice_#{mir.customer.custname}_#{mir.month.to_s(:number)}.csv"
    end

    def to_csv
      CSV.generate(force_quotes: true) do |csv|
        csv << header_line if header
        csv << line1
        csv << market_price_line
        csv << savings_line
        csv << membership_line
        csv << returns_line
      end
    end

    def line1
      [
        invoice_number,                        # InvoiceNo
        @mir.customer.custbillingbusinessname, # Customer
        Date.today.beginning_of_month,         # InvoiceDate
        Date.today.beginning_of_month + 30,    # DueDate
        'Net 30',                              # Terms
      ]
    end

    def line_item(product, amt, description: '', service_date: '', qty: 1)
      [
        invoice_number, # *InvoiceNo
        EMPTY_FIELD,    # *Customer
        EMPTY_FIELD,    # *InvoiceDate
        EMPTY_FIELD,    # *DueDate
        EMPTY_FIELD,    # Terms
        EMPTY_FIELD,    # Location
        EMPTY_FIELD,    # Memo
        product,        # Item(Product/Service)
        description,    # ItemDescription
        qty,            # ItemQuantity
        amt,            # ItemRate
        amt,            # *ItemAmount
        EMPTY_FIELD,    # Taxable
        EMPTY_FIELD,    # TaxRate
        service_date
      ]
    end

    def market_price_line
      line_item("Market Price", @mir.current_total,
        description:  market_desc,
        service_date: @mir.month.beginning_of_month
      )
    end

    def market_desc
      [
        @mir.orders.size,
        "order".pluralize(@mir.orders.size),
        @mir.orders.to_s,
      ].join " "
    end

    def savings_line
      line_item("Realized Savings", -@mir.gross_savings)
    end

    def membership_line
      line_item("Membership Fee", @mir.customer.subscription_amount)
    end

    def returns_line
      line_item("Returns", @mir.total_returns,
        description: "Product returns processed this month"
      )
    end

    def header_line
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
      )
    end
  end
end
