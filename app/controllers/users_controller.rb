class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @friend = Friend.new
    @friends = Friend.where(follower_id: @user.id)
    @users = []
    @friends.each do |friend|
      @users << User.find(friend.followee_id)
    end
    @current_user_friends = Friend.where(follower_id: current_user.id)
    @current_user_friends_users = []
    @current_user_friends.each do |friend|
      @current_user_friends_users << User.find(friend.followee_id).id
    end
    @current_friend = Friend.where(followee_id: @user.id)
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
