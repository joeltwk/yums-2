class AddFollowerAndFolloweeToFriends < ActiveRecord::Migration[7.0]
  def change
    add_reference :friends, :followee, null: false, index: false
    add_reference :friends, :follower, null: false, index: false

    add_foreign_key :friends, :users, column: :followee_id
    add_foreign_key :friends, :users, column: :follower_id
  end
end
