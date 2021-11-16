class Sku < ApplicationRecord
  self.table_name  = 'tblsku'
  self.primary_key = 'skuid'

  belongs_to :category, foreign_key: :categoryid
  belongs_to :high_price_vendor, class_name: 'Vendor', foreign_key: :skuhighpricevno

  validates_presence_of :skumaxtemp
  validates_presence_of :skumintemp

  def to_s
    sku
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
