class FavouritesController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = Favourite.new
    @favourite.restaurant = @restaurant
    @favourite.user = current_user
    if @favourite.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
