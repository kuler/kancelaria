class User < ActiveRecord::Base
	attr_accessible :username, :password, :password_confirmation, :firstname, :lastname, :active, :admin
	has_secure_password
	has_many :clients
end
