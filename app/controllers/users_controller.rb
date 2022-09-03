class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def show
    @friend = Friend.new
    @following = Friend.where(follower_id: @user.id)
    @followers = Friend.where(followee_id: @user.id)
    @current_user_friends = Friend.where(follower_id: current_user.id)
    @current_user_friends_users = []
    @current_user_friends.each do |friend|
      @current_user_friends_users << User.find(friend.followee_id).id
    end
    @current_friend = Friend.where(followee_id: @user.id)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
