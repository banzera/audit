class Customer < ApplicationRecord
  self.table_name  = 'tblcustomer'
  self.primary_key = 'custid'

  has_many :sku_infos, class_name: "SkuCustInfo", foreign_key: :custid

  scope :active, -> { where(discontinued: false) }

  validates :custname, presence: true
  validates :custbusinessname, presence: true
  validates :custfirst, presence: true
  validates :custlast, presence: true
  # validates :custsal, presence: true
  # validates :custtitle, presence: true
  # validates :custaddress, presence: true
  # validates :custcity, presence: true
  # validates :custst, presence: true
  # validates :custzip, presence: true
  # validates :custphone, presence: true
  # validates :custfax, presence: true
  # validates :custemail, presence: true
  # validates :custprimarycontact1, presence: true
  # validates :custphone1, presence: true
  # validates :custphonetype1, presence: true
  # validates :custemail1, presence: true
  # validates :custprimarycontact2, presence: true
  # validates :custphone2, presence: true
  # validates :custphonetype2, presence: true
  # validates :custemail2, presence: true
  validates :custtaxrate, presence: true
  # validates :custnotes, presence: true
  # validates :custdatecreated, presence: true
  # validates :custdatemodified, presence: true

  enum billing_mode: {
    monthly: 0,
    savings: 1,
  }

  def custbillingbusinessname
    super.presence || custbusinessname
  end

  def full_name
    "#{custsal} #{custfirst} #{custlast}"
  end

  def city_state_zip
    "#{custcity}, #{custst} #{custzip}"
  end

  def to_s
    custbusinessname
  end

  alias_attribute :created_at, :custdatecreated
  alias_attribute :updated_at, :custdatemodified
end
