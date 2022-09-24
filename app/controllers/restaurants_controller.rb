class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def show
    @title = "Restaurant Details"
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant)
    if user_signed_in?
      if @restaurant.favourites.find_by(user_id: current_user.id).nil?
        @favourite = Favourite.new
      else
        @favourite = Favourite.find_by(user_id: current_user.id, restaurant_id: @restaurant.id)
      end
    end
    @ratings = []
    @restaurant.reviews.each do |review|
      @ratings << review.rating
    end
    if @ratings.count.positive?
      @avg_rating = (@ratings.sum / @ratings.count).round(1)
    else
      @avg_rating = "No ratings yet"
    end
    @review = Review.new

    @markers =
      [{
        lat: @restaurant.latitude,
        lng: @restaurant.longitude,
        info_window: render_to_string(partial: "info_window", locals: { restaurant: @restaurant })
      }]
  end

  def index
    @title = "All Restaurants"
    @tab = 1
    @restaurants = Restaurant.all
    @rest_rating = {}

    @restaurants.each do |rest|
      @ratings = []
      rest.reviews.each do |review|
        @ratings << review.rating
      end
      if @ratings.count.positive?
        @avg_rating = @ratings.sum.fdiv(@ratings.count).round(1)
        @rest_rating[rest.id]= @avg_rating
      else
        @avg_rating = "No ratings yet"
      end
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def restaurants
    @tab = 1
    @title = "My Restaurants"
    @restaurants = Restaurant.where(user_id: params[:user_id])
    @rest_rating = {}

    @restaurants.each do |rest|
      @ratings = []
      rest.reviews.each do |review|
        @ratings << review.rating
      end
      if @ratings.count.positive?
        @avg_rating = @ratings.sum.fdiv(@ratings.count).round(1)
        @rest_rating[rest.id]= @avg_rating
      else
        @avg_rating = "No ratings yet"
      end
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    @user = User.all
    if @restaurant.save
      @user.each do |user|
        if user.role === "regular"
          @collection = Collection.new
          @collection.restaurant = @restaurant
          @collection.user = user
          if @collection.save
          else
            render :new, status: :unprocessable_entity
          end
        end
      end
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :cuisine, :description, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
