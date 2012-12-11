class AsigneeNullInTask < ActiveRecord::Migration
  def up
    change_column :tasks, :assignee_user_id, :integer, :null=>true
  end

  def down
    change_column :tasks, :assignee_user_id, :integer, :null=>false
  end
end
