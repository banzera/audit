class MonthlyInvoiceReport < ApplicationRecord
  self.table_name  = :monthly_invoice_report
  self.primary_key = :custid

  belongs_to :customer, class_name: 'Customer', foreign_key: :custid

  scope :for_customer, -> (customer) { where(custid: customer) }
  scope :in_range,     -> (date_range) { where(month: date_range) }

  scope :no_gen4, -> {
    joins(:customer).where.not("custbusinessname ilike 'gen4%'")
  }

  scope :current, -> { in_range(monthrange(0)) }
  scope :prev1,   -> { in_range(monthrange(1)) }
  scope :prev2,   -> { in_range(monthrange(2)) }
  scope :prev3,   -> { in_range(monthrange(3)) }
  scope :prev4,   -> { in_range(monthrange(4)) }
  scope :prev5,   -> { in_range(monthrange(5)) }

  attr_accessor :start_date

  def self.monthrange(x)
    day = Date.today - x.month
    range = day.beginning_of_month..day.end_of_month
  end

  def readonly?
    true
  end

  def to_s
     "Monthly Invoice Report"
  end

end
