class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends, class_name: 'Friend', foreign_key: 'followee_id, follower_id'
  has_one_attached :photo

  validates :name, presence: true
  validates :role, presence: true
  has_many :restaurants
  has_many :reviews
end
