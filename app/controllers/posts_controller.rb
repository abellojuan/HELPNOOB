class PostsController < ApplicationController
	def index
	  @posts = Post.all
	 
	  respond_to do |format|
	    format.html  # index.html.erb
	    format.json  { render :json => @posts }
	  end
	end

	def show
		@post=Post.where(slug: params[:id]).first

		respond_to	do |format|
			    format.html  # show.html.erb
			    format.json  { render :json => @posts }
			end
        
	end	

	

end
