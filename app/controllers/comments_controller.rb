class CommentsController < ApplicationController
  
  before_filter :require_user, only: [:new, :create]

  def new
    @post = Post.where(:id => params[:post_id]).first
    @comment =Comment.new
  end

  def create
  		  @comment =Comment.new(params[:comment])
        @post = Post.where(:id => params[:post_id]).first
        @comment.post_id =params[:post_id]
        @comment.user_id = current_user.id
        
        if @comment.save
        flash[:notice] = "Nice, thanks for commenting"
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




