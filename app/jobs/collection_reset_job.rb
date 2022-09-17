class CollectionResetJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.all.each do |u|
      u.view_count = 0
      u.save
    end
  end
end
