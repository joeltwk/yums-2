class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def show
    @tab = 5
    @title = "User Profile"
    @friend = Friend.new
    @following = Friend.where(follower_id: @user.id)
    @followers = Friend.where(followee_id: @user.id)
    @favourites = Favourite.where(user_id: @user)
    @restaurants = Restaurant.where(user_id: @user)
    if user_signed_in?
      @current_user_friends = Friend.where(follower_id: current_user.id)
      @current_user_friends_users = []
      @current_user_friends.each do |friend|
        @current_user_friends_users << User.find(friend.followee_id).id
      end
      @current_friend = Friend.find_by(follower_id: current_user.id, followee_id: @user.id)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
