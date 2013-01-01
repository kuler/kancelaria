class Activity < Task
  set_table_name 'tasks'
  set_inheritance_column nil

  attr_accessible :case_id, :assignee_user_id, :type, :task_type_id, :name, :description, :files_signature, :invoice_time

  default_scope :conditions => { :is_activity => true }

  def invoice_time

    return "" if not self.hours_invoice

    h = self.hours_invoice.floor
    m = (self.hours_invoice % 1 * 60).round
    return "%02d:%02d" % [h,m]
  end

  def invoice_time= time
    if not time or time.empty?
      self.hours_invoice = nil
    else
      subs = time.split(":")
      h = subs[0].to_i
      m = subs[1].to_f/60
      self.hours_invoice = h+m;
    end



  end

end