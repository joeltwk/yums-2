module RatingHelper
  def star_rating_class(rating, index)
    if index < rating
      "fill-yellow-400 stroke-yellow-400"
    else
      "fill-transparent stroke-gray-400"
    end
  end
end
