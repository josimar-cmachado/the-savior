class Gift < ApplicationRecord
  belongs_to :wedding
  has_many :orders
end
