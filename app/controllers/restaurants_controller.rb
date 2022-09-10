class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant)
    if @restaurant.favourites.find_by(user_id: current_user.id).nil?
      @favourite = Favourite.new
    else
      @favourite = Favourite.find_by(user_id: current_user.id, restaurant_id: @restaurant.id)
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def restaurants
    @restaurants = Restaurant.where(user_id: params[:user_id])
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
