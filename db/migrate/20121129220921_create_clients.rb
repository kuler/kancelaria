class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :shortname
      t.string :fullname
      t.boolean :active
      t.string :contact
      t.string :nip
      t.string :regon
      t.string :address
      t.timestamp :created

      t.timestamps
    end
  end
end
