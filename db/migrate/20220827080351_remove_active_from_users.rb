class RemoveActiveFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :active
  end
end
