class AddReferenceToFavourites < ActiveRecord::Migration[7.0]
  def change
    add_reference :favourites, :user, null: false, foreign_key: true
    add_reference :favourites, :restaurant, null: false, foreign_key: true
  end
end
