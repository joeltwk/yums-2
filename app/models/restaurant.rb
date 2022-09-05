class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :collections
  has_many :favourites
end
