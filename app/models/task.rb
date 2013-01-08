class Task < ActiveRecord::Base    
  include Modules::DateTimeRange
    
  default_scope :conditions => { :is_activity => false }

  attr_accessible :case_id, :assignee_user_id, :type, :task_type_id, :name, :description, :files_signature, :client

  # This will create methods:
  # * planned_to_start_at_date
  # * planned_to_start_at_date=
  # * planned_to_start_at_time
  # * planned_to_start_at_time=
  # * planned_to_finish_at_date
  # * planned_to_finish_at_date=
  # * planned_to_finish_at_time
  # * planned_to_finish_at_time=
  # * planned_to => { from: <Start DateTime>, to: <Finish DateTime> }
  has_datetime_range :planned_at, from: :planned_to_start_at, to: :planned_to_finish_at
  has_datetime_range :completed_at, from: :started_at, to: :finished_at

	belongs_to :case
	belongs_to :author, :class_name => 'User', :foreign_key => 'author_user_id'
	belongs_to :assignee, :class_name => 'User', :foreign_key => 'assignee_user_id'	
  belongs_to :type, :class_name => 'TaskType', :foreign_key => 'task_type_id'

  def client= val

  end

  def client
    if self.case == nil
      return nil
    end

    return self.case.client.id
  end
  
  def todo
    self.author!=self.assignee
  end  
end
