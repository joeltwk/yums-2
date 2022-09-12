class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  MAX_RATING = 5

  validates :rating, numericality: { in: 0..5 }
end
