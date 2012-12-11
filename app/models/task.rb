class Task < ActiveRecord::Base
  attr_accessible :planned_at_date, :planned_at_time, :type, :task_type_id, :name, :description, :planned_at

  attr_accessor :planned_at_date, :planned_at_time

	belongs_to :case
	belongs_to :author, :class_name => 'User', :foreign_key => 'author_user_id'
	belongs_to :assignee, :class_name => 'User', :foreign_key => 'assignee_user_id'	
	
  def type=(task_type)
    self.task_type_id = task_type.to_i
  end
  
  def type
    if task_type_id.present?
      TaskType.find(task_type_id)
    else
      false
    end
  end
  
  def planned_at_date
    return nil if not self.planned_at
    self.planned_at.strftime("%d/%m/%Y")
  end
  
  def planned_at_date= date
    self.planned_at = DateTime.new if self.planned_at == nil
    d = date.to_date
    self.planned_at = self.planned_at.change year: d.year, month: d.month, day: d.day
  end
  
  def planned_at_time
    return nil if not self.planned_at
    self.planned_at.strftime("%H:%M")
  end
   
  def planned_at_time= time
    self.planned_at = DateTime.new if self.planned_at == nil
    t = Time.parse(time)
    self.planned_at = self.planned_at.change hour: t.hour, min: t.min
  end
   
   
end
