class Prospect < ApplicationRecord

  acts_as_addressable :primary

  belongs_to :clinic_type
  belongs_to :assigned_to, class_name: 'User'

  # has_many :contacts

  def to_s
    "Prospect: #{office_name}"
  end

end
