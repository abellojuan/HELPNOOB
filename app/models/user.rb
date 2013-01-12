class User < ActiveRecord::Base
  attr_accessible :password_digest, :usermail, :username, :password
	has_secure_password
	has_many :posts
	
end
