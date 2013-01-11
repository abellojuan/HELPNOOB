class MainController < ApplicationController
  def index
	  @posts = Post.all
	 
	 end

	def show
		@post=Post.where(params[:id]).first

		       
	end	
end