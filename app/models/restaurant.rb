class Restaurant < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_one_attached :photo
end
