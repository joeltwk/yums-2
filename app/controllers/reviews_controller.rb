class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  before_action :set_user, only: %i[show]

  def show
    # @restaurant = Restaurant.find(params[:id])
    @title = "User Profile"
    @tab = 5
    @reviews = Review.all
    @following = Friend.where(follower_id: @user.id)
    @followers = Friend.where(followee_id: @user.id)
    @current_user_friends = Friend.where(follower_id: current_user.id)
    @current_user_friends_users = []
    @current_user_friends.each do |friend|
      @current_user_friends_users << User.find(friend.followee_id).id
    end
    @current_friend = Friend.find_by(follower_id: current_user.id, followee_id: @user.id)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
