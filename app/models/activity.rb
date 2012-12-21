class Activity < Task
  set_table_name 'tasks'
  set_inheritance_column nil
  
  attr_accessible :case_id, :assignee_user_id, :type, :task_type_id, :name, :description, :files_signature, :hours_invoice
  
  default_scope :conditions => { :is_activity => true }
  
end