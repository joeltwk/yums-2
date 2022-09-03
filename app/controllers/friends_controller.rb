class FriendsController < ApplicationController
  before_action :set_user, only: %i[index]
  before_action :find_user, only: %i[destroy]
  def index
    @following_table = Friend.where(follower_id: @user.id)
    @following = []
    @following_table.each do |f|
      @following << User.find(f.followee_id)
    end
  end

  def create
    @friends = Friend.new
    @friends.follower = current_user
    @friends.followee = User.find(params[:user_id])
    if @friends.save
      redirect_to user_path(User.find(params[:id]))
    end
  end

  def show
  end

  def destroy
    @current_friend = Friend.find_by(followee_id: @user2.id)
    @current_friend.destroy
    redirect_to user_path(@user2)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def find_user
    @user2 = User.find(params[:id])
  end
end
