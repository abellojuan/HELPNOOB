class CommentsController < ApplicationController
  
  before_filter :require_user, only: [:new, :create]
  before_filter :find_post
  
  def new
    @comment =Comment.new
  end

  def create
	  @comment = @post.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Nice, thanks for commenting"
      redirect_to post_path(@post)
    else
      flash[:alert] = "We could not save your comment because:"+
      @comment.errors.full_messages.to_sentence  
      redirect_to post_path(@post)
    end
   end

   private

   def find_post
     @post = Post.find(params[:post_id])
   end
end




