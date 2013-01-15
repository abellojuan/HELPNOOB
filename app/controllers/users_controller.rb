class UsersController < ApplicationController 
 def new 
 	@user = User.new
 end

 def create
 	@user=User.create(params[:user])
 	if @user.save
 	  redirect_to root_path, notice: "You register succesfully"
 	else
 		render 'new'
 	end
 end

 def show
 	@posts=Post.all.reverse
 	@comments=Comment.all.reverse
 end

end
