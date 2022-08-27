class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends, class_name: 'Friend', foreign_key: 'followee_id, follower_id'

  validates :name, presence: true
  validates :role, presence: true
end
