class TaskModifications < ActiveRecord::Migration
  def change
    add_column :tasks, :planned, :datetime
    rename_column :tasks, :finished, :completed
  end
end
