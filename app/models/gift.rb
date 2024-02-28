class Gift < ApplicationRecord
  belongs_to :wedding
  has_many :orders

  validates :total_quota, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates :value, presence: true
end
