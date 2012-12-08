class CreatedColumnRemoved < ActiveRecord::Migration
  def up
    remove_column :cases, :created
    remove_column :clients, :created
    remove_column :tasks, :created
    remove_column :users, :created
    
    rename_column :tasks, :assigned, :assigned_at
    rename_column :tasks, :completed, :completed_at
    rename_column :tasks, :planned, :planned_at
  end
  
  def down
    add_column :cases, :created, :datetime
    add_column :clients, :created, :datetime
    add_column :tasks, :created, :datetime
    add_column :users, :created, :datetime
    
    rename_column :tasks, :assigned_at, :assigned
    rename_column :tasks, :completed_at, :completed
    rename_column :tasks, :planned_at, :planned
  end
end
