class VariousMinorChanges < ActiveRecord::Migration
  def up
    change_column :users, :admin, :boolean, :default=>false, :null=>false    
    change_column :users, :active, :boolean, :default=>true,  :null=>false
    
    remove_column :tasks, :completed_at
    
    remove_column :tasks, :hours_total
  end

  def down
    change_column :users, :admin, :boolean, :null=>true
    change_column :users, :active, :boolean, :default=>true
    
    add_column :tasks, :completed_at, :datetime
    
    add_column :tasks, :hours_total, :integer    
  end
end
