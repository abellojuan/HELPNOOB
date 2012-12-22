class UpvotesController < ApplicationController
	 def new
    @post = Post.find(params[:post_id]) 
    @upvote =Upvote.new
    redirect_to post_path(@post)
     end

  def create
  		@upvote =Upvote.new(params[:upvote])
        @post = Post.find(params[:post_id]) 
        @upvote=@post.upvotes.new
        @upvote.post_id =params[:post_id]
        @upvote.save
        redirect_to post_path(@post)
		
    end
end



	  