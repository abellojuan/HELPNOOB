class Vote < ActiveRecord::Base
   attr_accessible :direction
   belongs_to :user ,  :counter_cache => true
   belongs_to :post  , :counter_cache => true

  def after_save
    self.update_counter_cache
  end

  def after_destroy
    self.update_counter_cache
  end
  
  def update_counter_cache
    post.votes_count = post.votes.where(direction: 'up').count - post.votes.where(direction: 'down').count
    post.save
  end
 
end
