class TaskModifications < ActiveRecord::Migration
  
  def up
    remove_column :tasks, :status
    remove_column :tasks, :active
    add_column :tasks, :planned, :datetime
    rename_column :tasks, :finished, :completed
    rename_column :tasks, :total, :hours_total
    rename_column :tasks, :invoice, :hours_invoice
  end
  
  def down
    add_column :tasks, :status, :integer
    add_column :tasks, :active, :boolean
    remove_column :tasks, :planned
    rename_column :tasks, :completed, :finished
    rename_column :tasks, :hours_total, :total 
    rename_column :tasks, :hours_invoice, :invoice
  end
end
