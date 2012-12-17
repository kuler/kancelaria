class TaskDatesReinvented < ActiveRecord::Migration
  def up
    rename_column :tasks, :planned_at, :planned_to_start_at
    add_column :tasks, :started_at, :datetime
    add_column :tasks, :planned_to_finish_at, :datetime
    add_column :tasks, :finished_at, :datetime
  end

  def down
    rename_column :tasks, :planned_to_start_at, :planned_at
    remove_column :tasks, :started_at
    remove_column :tasks, :planned_to_finish_at
    remove_column :tasks, :finished_at
  end
end
