class CreatingBloodyForeignKeys < ActiveRecord::Migration
  #here should be only change method with several column_add, had to do it differently
  #see: http://stackoverflow.com/questions/3170634/sqlite3sqlexception-cannot-add-a-not-null-column-with-default-value-null
  #for details.
  def self.up
    #client's creator
    add_column :clients, :user_id, :integer
    change_column :clients, :user_id, :integer, :null=>false
    
    
    #case's creator
    add_column :cases, :user_id, :integer
    change_column :cases, :user_id, :integer, :null=>false
    #which client 
    add_column :cases, :client_id, :integer
    change_column :cases, :client_id, :integer, :null=>false
    
    #case id (optional)
    add_column :tasks, :case_id, :integer
    #task's creator
    add_column :tasks, :author_user_id, :integer
    change_column :tasks, :author_user_id, :integer, :null=>false
    #task's assigned user
    add_column :tasks, :assignee_user_id, :integer
    change_column :tasks, :assignee_user_id, :integer, :null=>false
  end

  def self.down
    remove_column :clients, :user_id
    remove_column :cases, :user_id
    remove_column :cases, :client_id
    remove_column :tasks, :case_id
    remove_column :tasks, :author_user_id
    remove_column :tasks, :assignee_user_id
  end
end
