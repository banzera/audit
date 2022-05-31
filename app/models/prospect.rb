class Prospect < ApplicationRecord

  acts_as_addressable :primary

  belongs_to :clinic_type, required: false
  belongs_to :assigned_to, class_name: 'User', required: false

  # has_many :contacts

  def to_s
    "Prospect: #{office_name}"
  end

end
