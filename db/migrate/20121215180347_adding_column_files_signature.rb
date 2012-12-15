class AddingColumnFilesSignature < ActiveRecord::Migration
  def change
    add_column :cases, :files_signature, :string
    add_column :tasks, :files_signature, :string
  end
end
