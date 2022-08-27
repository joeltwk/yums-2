class AddUserToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :users, foreign_key: true
  end
end
