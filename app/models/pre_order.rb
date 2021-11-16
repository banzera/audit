class PreOrder < ApplicationRecord
  self.table_name  = 'tblpreorder'
  self.primary_key = 'preorderid'

  belongs_to :customer, foreign_key: :custid
  belongs_to :order, foreign_key: :orderid
  belongs_to :vendor, foreign_key: :preordervendorid

  scope :analyzed,  -> { where.not(preorderanalysisdate: nil)}
  scope :confirmed, -> { where.not(confirmationdate: nil)}
  scope :checked,   -> { where.not(preordercheck: nil)}

  scope :awaiting_analysis, -> { confirmed.where.not(preorderanalysisdate: nil) }

  def to_s
    preorderbatch
  end
end
