class Gift < ApplicationRecord
  belongs_to :wedding
  has_many :orders

  validates :total_quota, presence: true
  validates :title, presence: true, uniqueness: true
  validates :category, presence: true
  validates :value, presence: true

  has_one_attached :photo
  # Added closing curly brace here
end
