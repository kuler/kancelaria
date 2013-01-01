class TaskHoursInvoiceAsFloat < ActiveRecord::Migration
  def up
    change_column :tasks, :hours_invoice, :float, :default=>0,  :null=>false
  end

  def down
    change_column :tasks, :hours_invoice, :integer
  end
end
