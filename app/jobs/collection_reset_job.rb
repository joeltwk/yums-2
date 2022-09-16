class CollectionResetJob < ApplicationJob
  queue_as :default

  def perform(user)
    @restaurants = Collection.where(user:).limit(5)
  end
end
