require 'active_record'
class WorkCategory < ActiveRecord::Base

  has_many :work_items
  has_many :work_events

  validates :name, :column_name, presence: true
  validates_uniqueness_of :name, scope: [:column_name]
  
  def self.column_names_with_table
    self.column_names.map { |c| "#{table_name}.#{c}" }
  end

end
