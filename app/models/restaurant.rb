include PgSearch::Model

class Restaurant < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_one_attached :photo
  has_many :collections
  has_many :favourites

  pg_search_scope :global_search,
    against: [:name, :address, :cuisine, :description],
  using: {
    tsearch: { prefix: true }
  }
end
