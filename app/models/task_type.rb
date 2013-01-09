class TaskType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :color, presence: true

  def self.showed_in_filters
    self.where(:show_in_filter => true)
  end
end
