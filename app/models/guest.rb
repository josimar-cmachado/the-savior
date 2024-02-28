class Guest < ApplicationRecord
  belongs_to :wedding

  validates :full_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true, uniqueness: true, length: { minimum: 10, maximum: 15 }
end
