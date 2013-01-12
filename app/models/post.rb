class Post < ActiveRecord::Base
  attr_accessible :title, :url
  validates :title, presence: true
  validates :url, presence: true
  has_many :comments
  has_many :votes
  belongs_to :user
	def vote_number
		votes.where(direction: "up").count - votes.where(direction: "down").count
	end

	def find_user_id
		
		
	end

end

#Post.create(title:"hello world!", url:"http://fi.co/")