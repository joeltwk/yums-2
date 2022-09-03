class Restaurant < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_many :collection
end
