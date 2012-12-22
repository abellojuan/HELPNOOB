class Post < ActiveRecord::Base
  attr_accessible :title, :url
  has_many :comments
  has_many :upvotes

	
end

#Post.create(title:"hello world!", url:"http://fi.co/")