class PagesController < ApplicationController
  before_action :user_login?, only: [:home]

  def home
    if current_user.view_count.nil?
      @collection = Collection.where(user: current_user).limit(5)
    else
      @collection = Collection.where(user: current_user).limit(current_user.view_count)
    end
    @favourite = Favourite.new
    @title = "Recommendations"
  end

  def search
    @title = "Search"
    @tab = 2
    if params[:query].present?
      @restaurants = Restaurant.global_search(params[:query])
      @reviews = Review.where(restaurant: @restaurants).order(rating: :desc) unless @restaurants.nil?
      @users = User.global_search(params[:query])
    else
      @reviews = Review.order(rating: :desc)
    end
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
