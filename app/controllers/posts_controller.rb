class PostsController < ApplicationController
	
	before_filter :require_user, only: [:new, :create]
	
	def index
	  @posts = Post.all
	end


	def show
		@post=Post.where(:id => params[:id]).first
		@comment=@post.comments.new      
	end	


	def new
		@post = Post.new
	end


	def create

		@post=Post.new(params[:post])
		@post.user_id = current_user.id
			if @post.save
				flash[:notice] = "Your post have been submitted"
				redirect_to new_post_path
		    else
		      flash[:alert] = "Your post could not be saved: " +
		      @post.errors.full_messages.to_sentence
		      render 'new'
		    end

	end

end

