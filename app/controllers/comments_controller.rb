class CommentsController < ApplicationController
  def new
    @post = Post.where(params[:post_id]).first
    @comment =Comment.new

  end

  def create
  		  @comment =Comment.new(params[:comment])
        @post = Post.where(params[:post_id]).first
        @comment.post_id =params[:post_id]
        
        if @comment.save
        flash[:notice] = "Your post have been submitted"
        redirect_to post_path(@post)
        else
        flash[:alert] = "We could not save your comment because:"+
          @comment.errors.full_messages.to_sentence  
          redirect_to post_path(@post)
		    end
    end

  def show
  end

end



