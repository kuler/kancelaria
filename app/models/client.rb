class Client < ActiveRecord::Base
	belongs_to :user
	has_many :cases
	
	validates :fullname, presence: true
	validates :nip, presence: true, mask: "999-999-99-99"
	validates :contact, presence: true
end
