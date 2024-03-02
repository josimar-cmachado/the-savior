class Gift < ApplicationRecord
  belongs_to :wedding
  has_many :orders
  has_one_attached :photo

  validates :total_quota, presence: true
  validates :title, presence: true, uniqueness: true
  validates :category, presence: true
  validates :value, presence: true
end
