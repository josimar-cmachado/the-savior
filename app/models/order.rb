class Order < ApplicationRecord
  belongs_to :gift
  has_one :wedding, through: :gift
end
