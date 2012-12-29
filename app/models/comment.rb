class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id
  validates :content, presence: true
  belongs_to :posts

end
