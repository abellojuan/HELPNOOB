class Post < ActiveRecord::Base
  attr_accessible :title, :url
  has_many :comments

	
end

#Post.create(title:"hello world!", url:"http://fi.co/")