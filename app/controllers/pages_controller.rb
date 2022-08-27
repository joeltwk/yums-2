class PagesController < ApplicationController
  before_action :user_login?, only: [:home]
  def home
  end

  private

  def user_login?
    if current_user
      home
    else
      redirect_to new_user_session_path
    end
  end
end
