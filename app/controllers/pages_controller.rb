class PagesController < ApplicationController
  before_action :user_login?, only: [:home]

  def home
    if current_user.view_count.nil?
      @collection = Collection.where(user: current_user).limit(5)
    else
      @collection = Collection.where(user: current_user).limit(current_user.view_count)
    end
    @favourite = Favourite.new
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
