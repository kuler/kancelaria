class SetupRequiredFieldsInModels < ActiveRecord::Migration
  def up

    change_column :cases, :name, :string, :null=>false
    change_column :cases, :active, :boolean, :default=>true
    change_column :clients, :shortname, :string, :null=>false
    change_column :tasks, :name, :string, :null=>false
    change_column :users, :name, :string, :null=>false
    change_column :users, :password, :string, :null=>false
    change_column :users, :firstname, :string, :null=>false
    change_column :users, :lastname, :string, :null=>false
        
  end

  def down
    change_column :cases, :name, :string
    change_column :cases, :active, :boolean
    change_column :clients, :shortname, :string
    change_column :tasks, :name, :string
    change_column :users, :name, :string
    change_column :users, :password, :string
    change_column :users, :firstname, :string
    change_column :users, :lastname, :string
  end
end
