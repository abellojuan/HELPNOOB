class UsersController < ApplicationController 
 
  def new 
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
   	@user = User.create(params[:user])
   	  if @user.save
   	    redirect_to root_path, notice: "You register succesfully"
   	  else
   	    flash[:alert] = "Registration was impossible"+
        @user.errors.full_messages.to_sentence  
        render 'new'
   	  end
  end

  def show
   	@user = User.find(params[:id])
   	@posts = @user.posts.last(10)
   	@comments = @user.comments.last(10)
  end
end


