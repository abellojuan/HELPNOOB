class VotesController < ApplicationController
  
  def create
    post=Post.where(:id => params[:post_id]).first
    post.votes.create(direction: params[:direction])
    redirect_to root_path
  end


end
