class Client < ActiveRecord::Base
	belongs_to :user
	has_many :cases
	
	validates :fullname, presence: true
	validates :nip, presence: true
	validates :contact, presence: true
end
