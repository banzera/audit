class PreOrder < ApplicationRecord
  include HasBatch
  self.table_name  = 'tblpreorder'
  self.primary_key = 'preorderid'

  belongs_to :customer, foreign_key: :custid
  belongs_to :order,    foreign_key: :orderid,          optional: true
  belongs_to :vendor,   foreign_key: :preordervendorid, optional: true

  has_many :items, class_name: 'PreOrderItem', foreign_key: :preorderid

  alias_attribute :notes, :preordernotes

  scope :analyzed,  -> { where.not(preorderanalysisdate: nil)}
  scope :confirmed, -> { where.not(confirmationdate: nil)}
  scope :checked,   -> { where.not(preordercheck: nil)}

  scope :awaiting_analysis, -> { confirmed.where.not(preorderanalysisdate: nil) }

  validates :preorderdate, presence: true

  has_batch_number :preorderbatch, date: :preorderdate, prefix: 'P-', attrs: 'customer.custname' do
    PreOrder
      .where("DATE(preorderdate) = ?", self.preorderdate)
      .where(custid: self.custid)
      .count || 0
  end

end
