class AddActiveToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :active, :boolean
  end
end
