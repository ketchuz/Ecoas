class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def user_is_admin!
  	# return if current_user.email != 'admin'
  	if current_user.email == 'admin'
  		return
  	else
  		flash[:alert] = "Hahaha nice try... but you aint admin c:"
  		redirect_to root_url
  	end
  end
  

  def current_user
  	User.find_by id: session[:user_id] if session[:user_id]
  end

end
