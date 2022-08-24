class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = set_user
    @review.save
  end

  def edit
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_user
    @review = Review.find(params[:user_id])
  end
end
