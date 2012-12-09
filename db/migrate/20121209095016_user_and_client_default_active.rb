class UserAndClientDefaultActive < ActiveRecord::Migration
  def up
    change_column :users, :active, :boolean, :default => true
    change_column :clients, :active, :boolean, :default => true
  end

  def down
    change_column :users, :active, :boolean  
    change_column :clients, :active, :boolean
  end
end
