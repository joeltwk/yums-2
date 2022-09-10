class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :friends, class_name: 'Friend', foreign_key: 'followee_id, follower_id'

  has_many :follower_relationships, foreign_key: :followee_id, class_name: 'Friend'
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followee_relationships, foreign_key: :follower_id, class_name: 'Friend'
  has_many :followees, through: :followee_relationships, source: :followee

  has_one_attached :photo
  has_many :restaurant

  validates :name, presence: true
  validates :role, presence: true
  has_many :restaurants
  has_many :reviews
end
