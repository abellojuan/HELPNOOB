class VotesController < ApplicationController
  
  before_filter :require_user

  def create
    @post = Post.find(params[:post_id])
    @post.votes.create(direction: params[:direction])
    @post.update_attribute(:votes_count, @post.vote_number)
    @post.update_attribute(:hotness_count, @post.hotness)
    redirect_to :back
  end
end
