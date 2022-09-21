class FavouritesController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  before_action :set_favourite, only: [:destroy]

  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = Favourite.new
    @favourite.restaurant = @restaurant
    @favourite.user = current_user
    @collection = Collection.all
    collection = @collection.find_by(restaurant: @restaurant, user: current_user)

    if @favourite.save
      collection.destroy unless collection.nil?
      if params[:favourite][:location] == "home"
        if current_user.view_count.nil?
          current_user.view_count = 4
        else
          current_user.view_count -= 1
        end
        current_user.save
      else
        redirect_to restaurant_path(@restaurant)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @tab = 4
    @title = "My Favourites"
    @user = User.find(params[:user_id])
    @favourites = Favourite.where(user_id: @user)
  end

  def destroy
    @restaurant_id = @favourite.restaurant_id
    @favourite.destroy
    redirect_to restaurant_path(@restaurant_id), status: 303
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_favourite
    @favourite = Favourite.find(params[:id])
  end
end
