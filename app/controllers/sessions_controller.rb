class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by email: params[:email].downcase
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		if user.email == 'admin'
  			flash[:notice] = "You are signed in"
  			redirect_to admin_path
  		else
  			redirect_to dashboard_path
  		end
  	else
  		flash.now[:alert] = "Invalid email/password"
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "You are now signed out!"
  	redirect_to root_url
  end

end
