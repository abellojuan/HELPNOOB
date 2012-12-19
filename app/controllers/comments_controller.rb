class CommentsController < ApplicationController
  def new
    @comment =Comment.new

  end

  def create
  		  @comment =Comment.new(params[:comment])
        @post=Post.find(params[:post_id])
  	  	@comment.post_id =params [:post_id]
        @comment.save
        redirect_to post_path(@comment.post.id)
		
    end

  def show
  end

end


