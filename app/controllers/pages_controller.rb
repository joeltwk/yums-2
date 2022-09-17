class PagesController < ApplicationController
  before_action :user_login?, only: [:home]

  def home
    @restaurants = Collection.where(user: current_user)
    # @restaurant = []
    # CollectionResetJob.set(wait: 10.second).perform_later(current_user)
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
