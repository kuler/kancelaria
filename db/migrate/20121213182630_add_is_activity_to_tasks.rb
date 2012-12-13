class AddIsActivityToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :is_activity, :bool

  end
end
