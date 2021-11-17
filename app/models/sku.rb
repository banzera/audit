class Sku < ApplicationRecord
  include PgSearch::Model

  self.table_name  = 'tblsku'
  self.primary_key = 'skuid'

  belongs_to :category, foreign_key: :categoryid
  belongs_to :high_price_vendor, class_name: 'Vendor', foreign_key: :skuhighpricevno, optional: true

  validates_presence_of :skumaxtemp
  validates_presence_of :skumintemp

  pg_search_scope :search,
                  against: :everything,
                  using:  {
                    tsearch: {
                      dictionary:      'english',
                      tsvector_column: 'tsv',
                      any_word:        true,
                      prefix:          true,
                      negation:        true,
                    }
                  }

  def to_s
    sku
  end

  def missing_temperature_values?
    skumaxtemp.blank? ||
    skumintemp.blank?
  end

  class VendorDetail < OpenStruct ; end

  def vendors
    (1..10).collect do |i|
      ii = '%02d' % i
      vid = self.send("vno#{ii}")
      next unless vid&.positive?

      v = Vendor.find(vid)

      VendorDetail.new(
        id:   vid,
        name: v.vendorname,
        abbr: v.vendorabbr,
        sku:  self.send("vsku#{ii}"),
        url:  self.send("vhl#{ii}")
      )
   end.compact
  end
end
