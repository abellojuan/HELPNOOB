class PostsController < ApplicationController	
  before_filter :require_user, only: [:new, :create]
  
    def index
	  @posts = Post.order("hotness_count DESC")
	end

	def all_times
	  @posts = Post.order("votes_count DESC")
    end

    def incoming
    @posts = Post.order('created_at')
    end

	def show
	  @post=Post.find(params[:id])
	  @comment=@post.comments.new      
	end	

	def new
	  @post = Post.new
	end

	def create
	  @post=Post.new(params[:post])
	  @post.user = current_user
	    if @post.save
		  flash[:notice] = "Your post has been submitted"
		  redirect_to new_post_path
	    else
	      flash[:alert] = "Your post could not be saved: " +
	      @post.errors.full_messages.to_sentence
	      render 'new'
		end
	end
end

