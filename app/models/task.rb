class Task < ActiveRecord::Base
	belongs_to :case
	belongs_to :author, :class_name => 'User', :foreign_key => 'author_user_id'
	belongs_to :assignee, :class_name => 'User', :foreign_key => 'assignee_user_id'
	has_one :type, :class_name => 'TaskType', :foreign_key => 'task_type_id'
end
