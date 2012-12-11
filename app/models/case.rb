class Case < ActiveRecord::Base
	belongs_to :client
	belongs_to :user
	
	validates :name, presence: true
	validates :client, presence: true
end
