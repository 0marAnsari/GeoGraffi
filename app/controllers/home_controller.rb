class HomeController < ApplicationController
  def index
    @entries = current_user.entries if logged_in?
  end
end
