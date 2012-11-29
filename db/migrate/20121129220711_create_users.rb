class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :firstname
      t.string :lastname
      t.boolean :active
      t.boolean :admin
      t.timestamp :created

      t.timestamps
    end
  end
end
