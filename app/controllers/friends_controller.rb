class FriendsController < ApplicationController
  before_action :set_user, only: %i[destroy]
  def index
    @friends = Friend.where(follower_id: current_user.id)
    @users = []
    @friends.each do |friend|
      @users << User.find(friend.followee_id)
    end
  end

  def create
    @friends = Friend.new
    @friends.follower = current_user
    @friends.followee = User.find(params[:user_id])
    if @friends.save
      redirect_to user_path(User.find(params[:id]))
    else
      raise
    end
  end

  def show
  end

  def destroy
    @current_friend = Friend.find_by(followee_id: @user.id)
    @current_friend.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
