class Wedding < ApplicationRecord
  belongs_to :user
  has_many :gifts
  has_many :orders, through: :gifts
end
