class ChangeRestaurantDescriptionType < ActiveRecord::Migration[7.0]
  def change
    change_column :restaurants, :description, :text
  end
end
