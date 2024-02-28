class Wedding < ApplicationRecord
  belongs_to :user
  has_many :gifts, dependent: :destroy
  has_many :orders, through: :gifts, dependent: :destroy
  has_many :guests, dependent: :destroy

  validates :welcome_message, presence: true
  validates :address, presence: true
  validates :wedding_info, presence: true
  validates :tips, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :partner_email, presence: true
  validates :partner_profile, presence: true
  validates :partner_phone, presence: true
  validates :partner_first_name, presence: true
  validates :partner_last_name, presence: true
end
