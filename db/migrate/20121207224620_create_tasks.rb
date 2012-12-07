class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.integer :priority
      t.datetime :created
      t.datetime :assigned
      t.datetime :finished
      t.boolean :active
      t.integer :total
      t.integer :invoice

      t.timestamps
    end
  end
end
