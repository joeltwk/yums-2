class CollectionsController < ApplicationController
  before_action :set_collection, only: [:destroy]

  def destroy
    @collection.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def set_collection
    @collection = Collection.find(params[:id])
  end
end
