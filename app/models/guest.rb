class Guest < ApplicationRecord
  belongs_to :wedding

  validates :full_name, presence: true, length: { minimum: 3, maximum: 50 }, uniqueness: true
  validates :phone, presence: true, uniqueness: true, length: { minimum: 10, maximum: 15 }
end
