class HomeController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def index
    #redirect_to courses_list_url
  end
end
