class Activity < Task
  set_table_name 'tasks'
  set_inheritance_column nil
  
  default_scope :conditions => { :is_activity => true }
end