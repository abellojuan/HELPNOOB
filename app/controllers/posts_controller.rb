class PostsController < ApplicationController
	def index
	  @posts = Post.all
	 @upvote =Upvote.new
	 
	  respond_to do |format|
	    format.html  # index.html.erb
	    format.json  { render :json => @posts }
	  end
	end

	def show
		@post=Post.find(params[:id])
		@comment=@post.comments.new

		respond_to	do |format|
			    format.html  # show.html.erb
			    format.json  { render :json => @posts }
			end
       
	end	


	def new
		@post = Post.new
		respond_to	do |format|
			    format.html  
			    format.json  { render :json => @posts }
		end
	end

	def create
		@post=Post.new(params[:post])
		@post.save
		redirect_to new_post_path
	end

end
