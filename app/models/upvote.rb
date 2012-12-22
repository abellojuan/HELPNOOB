class Upvote < ActiveRecord::Base
  attr_accessible :post_id
  belongs_to :posts
end
