class PagesController < ApplicationController
  before_action :user_login?, only: [:home]

  def home
    @restaurants = Collection.where(user: current_user).limit(5)
    @favourite = Favourite.new
  end

  def search
    if params[:query].present?
      @restaurants = Restaurant.global_search(params[:query])
      @users = User.global_search(params[:query])
    end

    @reviews = Review.order(rating: :desc)
  end

  private

  def user_login?
    if current_user
      home
    else
      redirect_to new_user_session_path
    end
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
