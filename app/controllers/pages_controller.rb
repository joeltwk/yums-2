class PagesController < ApplicationController
  before_action :user_login?, only: [:home]

  def home
    @restaurants = Collection.where(user: current_user).limit(5)
    @favourite = Favourite.new
  end

  def search
    if params[:query].present?
      sql_query = <<~SQL
        name ILIKE :query
        OR description ILIKE :query
        OR cuisine ILIKE :query
        OR address ILIKE :query
      SQL
      @restaurants = Restaurant.where(sql_query, query: "%#{params[:query]}%")
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
