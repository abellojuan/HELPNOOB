class Post < ActiveRecord::Base
  attr_accessible :title, :url
  has_many :comments

	before_create :generate_slug
	def to_param
		slug
	end

	def generate_slug
	#	self.slug =title.split(' ').join('_')
		self.slug = "#{self.id}-#{self.title.parameterize}"
	end	
end

#Post.create(title:"hello world!", url:"http://fi.co/")