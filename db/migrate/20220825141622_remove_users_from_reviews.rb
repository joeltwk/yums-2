class RemoveUsersFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :users, null: false, foreign_key: true
  end
end
