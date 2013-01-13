class Comment < ActiveRecord::Base
  attr_accessible :content 
  validates :content, presence: true
  belongs_to :user
  belongs_to :post
end
