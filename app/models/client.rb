class Client < ActiveRecord::Base
	belongs_to :user
	has_many :cases
	
	validates :shortname, presence: true, uniqueness: true
	validates :fullname, presence: true
	validates :email, :presence=>false, :email=>true
end
