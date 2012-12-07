class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :name
      t.datetime :created
      t.boolean :active
      t.text :description

      t.timestamps
    end
  end
end
