class User < ActiveRecord::Base
  attr_accessible :twitter
	has_secure_password
	has_many :posts
	has_many :comments	
end
