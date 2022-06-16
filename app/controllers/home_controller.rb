class HomeController < ApplicationController
  def home
    @user = current_user
  end

  def timeline
  end
end
