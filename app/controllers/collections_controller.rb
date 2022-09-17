class CollectionsController < ApplicationController
  before_action :set_collection, only: [:destroy]

  def destroy
    @collection.destroy
    if current_user.view_count.nil?
      current_user.view_count = 1
    else
      current_user.view_count += 1
    end
    current_user.save
    redirect_to root_path, status: :see_other
  end

  private
  def set_collection
    @collection = Collection.find(params[:id])
  end
end
