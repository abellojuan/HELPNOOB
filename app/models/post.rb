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

  def hotness
    s = votes.where(direction: "up").count - votes.where(direction: "down").count
    if s > 0
      sign = 1
    elsif s < 0
      sign = -1
    else
      sign = 0
    end
    
    order = Math.log10([s.abs, 1].max)
    seconds = created_at - DateTime.new(1970,1,1)
    long_num = order + sign * seconds.to_f / 45000
    long_num.round(7)  
  end 


end

