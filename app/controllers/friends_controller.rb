class FriendsController < ApplicationController
  before_action :set_user, only: %i[index]
  before_action :set_friends, only: [:destroy]

  def index
    # @following_table = Friend.where(follower_id: @user.id)
    # @following = []
    # @following_table.each do |f|
    #   @following << User.find(f.followee_id)
    # end
    if params[:query].present?
      @following = @user.followees.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @following = @user.followees
    end
  end

  def create
    @friends = Friend.new
    @friends.follower = current_user
    @friends.followee = User.find(params[:user_id])
    if @friends.save
      redirect_to request.referrer
    end
  end

  def show
  end

  def destroy
    @followee = @friends.followee_id
    @friends.destroy
    # redirect_to user_path(@followee), status: 303
    redirect_to request.referrer
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_friends
    @friends = Friend.find(params[:id])
  end
end
