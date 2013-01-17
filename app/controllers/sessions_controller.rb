class SessionsController < ApplicationController
 def new
 end

 def create
 	#user=User.where(username: params[:username])
 	user=User.find_by_username(params[:username])
 	if user && user.authenticate(params[:password])
 		session[:user_id] = user.id
 		redirect_to root_path, notice:"You have logged in"
 	else
 		flash[:error] = "Couldn't log you in!"
 		render 'new'
 	end
 end

 def destroy
	session[:user_id] = nil
	redirect_to login_path, notice:"You just logged out."
 end

 def fotokio
 end

end

