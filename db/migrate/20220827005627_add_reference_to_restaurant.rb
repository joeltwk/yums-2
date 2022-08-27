class AddReferenceToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_reference :restaurants, :user, null: false, foreign_key: true
  end
end
