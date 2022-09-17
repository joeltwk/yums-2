class AddViewCountToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :view_count, :integer
  end
end
