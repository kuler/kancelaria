class Client < ActiveRecord::
	belongs_to :user
	has_many :cases
end
