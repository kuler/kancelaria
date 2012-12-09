class User < ActiveRecord::Base
  has_many :clients
  
	attr_accessible :password_confirmation, :name, :password, :firstname, :lastname, :active, :admin
	attr_accessor :password_confirmation
	
	before_save :encrypt_password
	
	validates :password, presence: true, confirmation: true
  validates :name, presence: true, uniqueness: true
	
	def self.authenticate name, password
    user = User.find_by_name name
    if user && user.password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      false
    end
  end
  
  protected
	
	def encrypt_password
    if password_confirmation.present? and password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret password, salt
    end       
  end 
end
