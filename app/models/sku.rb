class Sku < ApplicationRecord
  include PgSearch::Model
  include ::HasBarcode

  self.table_name  = 'tblsku'
  self.primary_key = 'skuid'

  DC_LOC_NONE = 'N/A'.freeze

  belongs_to :category, foreign_key: :categoryid
  belongs_to :sku_class, foreign_key: :skuclassid, optional: true
  belongs_to :high_price_vendor, class_name: 'Vendor', foreign_key: :skuhighpricevno, optional: true

  belongs_to :house_brand_for, class_name: 'Sku', primary_key: :skuid, optional: true

  has_many :subs, class_name: 'SkuSubstitution', foreign_key: :house_brand_id
  has_many :cust_info, class_name: SkuCustInfo.name, foreign_key: :skuid

  has_one :inventory_count, class_name: 'InventoryCounts', foreign_key: :skuid

  has_barcode :barcode,
    :outputter => :svg,
    :type => :code_39,
    :value => Proc.new { |sku| sku.sku }

  scope :in_dc,      -> { where(skuid: InventoryCounts.in_dc.pluck(:skuid)) }
  scope :in_transit, -> { where(skuid: InventoryCounts.in_transit.pluck(:skuid)) }
  scope :has_issue,  -> { where(has_issue: true).or(Sku.where(skuid: InventoryCounts.in_dc.no_location.pluck(:skuid))) }

  scope :needing_attention, -> { has_issue.where(categoryid: 3) }

  pg_search_scope :search,
                  against: :everything,
                  order_within_rank: "skuid asc",
                  using:  {
                    tsearch: {
                      dictionary:      'english',
                      tsvector_column: 'tsv',
                      any_word:        true,
                      prefix:          true,
                      negation:        true,
                    }
                  }

  validates :itemno, uniqueness: true
  validates :sku,    uniqueness: true

  def to_s
    "SKU #{id} (#{skudesc&.truncate(20) || '<no description>'})"
  end

  alias_attribute :id, :skuid
  alias_attribute :min_temp, :skumintemp
  alias_attribute :max_temp, :skumaxtemp
  alias_attribute :description, :skudesc

  def duplicate!
  end

  def mark_has_issue!
    update(has_issue: true)
  end

  def resolve_issue!
    update(has_issue: false)
  end

  def has_location?
    DC_LOC_NONE != dcloc
  end

  def missing_temperature_values?
    return false if skumintemp.nil? && skumaxtemp.nil?

    skumaxtemp.zero? &&
    skumintemp.zero?
  end

  def most_recent_po
    PurchaseOrderItem.where(skuid: skuid)
                     .includes(:purchase_order)
                     .joins(:purchase_order)
                     .order(podate: :desc)
                     .limit(1)
                     .first
  end

  def all_subs
    # sss = if is_house_brand?
    #   subs
    # else
      ss  = SkuSubstitution.where(sub_id: self.skuid)
      sss = SkuSubstitution.where(house_brand_id: ss.pluck(:house_brand_id))
    # end
    # Sku.where(skuid: sss.pluck(:sub_id))
  end

  def is_house_brand?
    house_brand_for.present?
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
