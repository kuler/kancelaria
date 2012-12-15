class EnhancingClientAttributes < ActiveRecord::Migration
  def change
    add_column :clients, :street, :string
    add_column :clients, :city, :string
    add_column :clients, :zipcode, :string
    add_column :clients, :email, :string
    add_column :clients, :website, :string
  end
end
