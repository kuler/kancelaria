class Activity < Task
  include Modules::TimeHelper
  set_table_name 'tasks'
  set_inheritance_column nil

  attr_accessible :case_id, :assignee_user_id, :type, :task_type_id, :name, :description, :files_signature, :invoice_time

  default_scope :conditions => { :is_activity => true }

  def invoice_time
    return "" if self.new_record?
    hours_to_time_s self.hours_invoice
  end

  def invoice_time= time
    self.hours_invoice = time_s_to_hours time
  end

  def real_time
    return hours_to_time_s(self.hours_real)
  end

  def hours_real
    if self.started_at and self.finished_at
      m = (self.finished_at - self.started_at).to_f / 3600
    else
      m = 0
    end
  end

end