class FollowersController < ApplicationController
  before_action :set_user, only: %i[index]

  def index
    if params[:query].present?
      @followers = @user.followers.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @followers = @user.followers
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
