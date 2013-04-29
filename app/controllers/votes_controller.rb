class VotesController < ApplicationController
  
  before_filter :require_user

  def create
    @post = Post.find(params[:post_id])
    @post.votes.create(direction: params[:direction])
    @post.update_attribute(:votes_count, @post.vote_number)
    redirect_to root_path
  end
end
