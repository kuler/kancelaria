class Task < ActiveRecord::Base
  default_scope :conditions => { :is_activity => false }

  attr_accessible :case_id, :assignee_user_id, :completed_at_date, :completed_at_time, :planned_at_date, :planned_at_time, :type, :task_type_id, :name, :description, :planned_at

  attr_accessor :planned_at_date, :planned_at_time

	belongs_to :case
	belongs_to :author, :class_name => 'User', :foreign_key => 'author_user_id'
	belongs_to :assignee, :class_name => 'User', :foreign_key => 'assignee_user_id'	
  belongs_to :type, :class_name => 'TaskType', :foreign_key => 'task_type_id'	
  
  def todo
    self.author!=self.assignee
  end

  
  def planned_at_date
    return nil if not self.planned_at
    self.planned_at.strftime("%d/%m/%Y")
  end
  
  def planned_at_date= date
    if date == ""
      self.planned_at = nil
    else
      self.planned_at = DateTime.new if self.planned_at == nil
      d = date.to_date
      self.planned_at = self.planned_at.change year: d.year, month: d.month, day: d.day
    end 
  end
  
  def planned_at_time
    return nil if not self.planned_at
    self.planned_at.strftime("%H:%M")
  end
   
  def planned_at_time= time
    if time == ""
      return if self.planned_at == nil
      time = "00:00" 
    end
         
    self.planned_at = DateTime.new if self.planned_at == nil
    t = Time.parse(time)
    self.planned_at = self.planned_at.change hour: t.hour, min: t.min
  end
   
  def completed_at_date
    return nil if not self.completed_at
    self.completed_at.strftime("%d/%m/%Y")
  end
  
  def completed_at_date= date
    if date == ""
      self.completed_at = nil
    else
      self.completed_at = DateTime.new if self.completed_at == nil
      d = date.to_date
      self.completed_at = self.completed_at.change year: d.year, month: d.month, day: d.day
    end
  end
  
  def completed_at_time
    return nil if not self.completed_at
    self.completed_at.strftime("%H:%M")
  end
   
  def completed_at_time= time
    if time == ""
      return if self.completed_at == nil
      time = "00:00" 
    end
    
    self.completed_at = DateTime.new if self.completed_at == nil
    t = Time.parse(time)
    self.completed_at = self.completed_at.change hour: t.hour, min: t.min
  end
   
   
end
