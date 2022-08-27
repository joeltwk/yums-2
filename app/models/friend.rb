class Friend < ApplicationRecord
  belongs_to :followee, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  # validates :check_followee_and_follower

  def check_followee_and_follower
    error.add(:followee, 'followee error') if followee.id == follower.id
  end
end
