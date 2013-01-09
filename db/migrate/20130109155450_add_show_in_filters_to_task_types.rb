class AddShowInFiltersToTaskTypes < ActiveRecord::Migration
  def change
    add_column :task_types, :show_in_filter, :boolean

  end
end
