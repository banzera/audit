class PurchaseOrder < ApplicationRecord
  self.table_name  = 'tblpurchaseorder'
  self.primary_key = 'poid'

  belongs_to :supplier1, class_name: 'Supplier', foreign_key: :splrid
  belongs_to :supplier2, class_name: 'Supplier', foreign_key: :splrid2

  has_many :items, class_name: 'PurchaseOrderItem', foreign_key: :poid

  scope :outstanding, -> { where(poid: PurchaseOrderItem.unfulfilled.pluck(:poid)) }

  validates_presence_of :supplier1,
                        :supplier2,
                        :posplrorderno,
                        :podate

  before_create :set_pobatch!

  def self.ship_types
    select(:poshiptype).distinct.pluck(:poshiptype).compact
  end

  def self.paid_methods
    select(:pomethodpaid).distinct.pluck(:pomethodpaid).compact
  end

  def unfullfilled?
    items.unfulfilled.any?
  end

  def to_s
    pobatch
  end

  BATCH_SERIAL_NUMBER_FORMAT = '%02d'.freeze

  def supplier_date_serial_number
    x = PurchaseOrder
          .where("DATE(podate) = ?", self.podate)
          .where(supplier1: self.supplier1)
          .count || 0

    BATCH_SERIAL_NUMBER_FORMAT % (x+1)
  end

  private

  def calculate_batch_string
    batch_string = [
      supplier1.splrname,
      podate.to_s(:yymmdd),
      supplier_date_serial_number,
    ].join('X')
  end

  def set_pobatch!
    self.pobatch = calculate_batch_string
  end
end
