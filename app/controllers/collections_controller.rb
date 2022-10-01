class CollectionsController < ApplicationController
  before_action :set_collection, only: [:destroy]

  def destroy
    @collection.destroy
    if current_user.view_count.nil?
      current_user.view_count = 4
    else
      current_user.view_count -= 1
    end
    current_user.save
  end

  private
  def set_collection
    @collection = Collection.find_by(restaurant_id: params[:id])
  end
end
