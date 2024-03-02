class Order < ApplicationRecord
  belongs_to :gift
  has_one :wedding, through: :gift
 

  validates :full_name, presence: true
  validates :message, presence: true
end
