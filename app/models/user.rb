class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         # :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  belongs_to :created_by,      class_name: 'User', optional: true
  belongs_to :updated_by,      class_name: 'User', optional: true

  # has_many :notes

  SYSTEM_USER_ID = 0

  def full_name
    # put a real method here to format the user's name
    "#{first_name} #{last_name}"
  end

  def self.system_user
    find_or_create_by(id: SYSTEM_USER_ID) do |user|
      user.first_name      = 'System'
      user.last_name       = 'User'
      user.email           = 'hldds@outlook.com'
      user.password        = ENV.fetch('INITIAL_ADMIN_PASSWORD')
      user.confirmed_at    = Time.current
      user.created_by_id   = 0
      user.is_admin        = true
    end
  end
end
