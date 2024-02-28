class Guest < ApplicationRecord
  belongs_to :wedding

  validates :full_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
