class Review < ApplicationRecord
  belongs_to :user
  belongs_to :wedding
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :user, uniqueness: { scope: :wedding, message: 'Você já avaliou este casamento.' }
end
