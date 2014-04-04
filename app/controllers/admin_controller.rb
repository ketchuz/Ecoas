class AdminController < ApplicationController
  
	before_action :user_is_admin!

  def index
  	@users = User.all
  end

  def new
  end
end
