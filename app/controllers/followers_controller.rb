class FollowersController < ApplicationController
  before_action :set_user, only: %i[index]

  def index
    @followers_table = Friend.where(followee_id: @user.id)
    @followers = []
    @followers_table.each do |f|
      @followers << User.find(f.follower_id)
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
