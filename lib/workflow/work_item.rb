require 'active_record'
class WorkItem < ActiveRecord::Base

	validates :action, :display, presence: true
	validates_uniqueness_of :action, scope: [:work_category_id]

  belongs_to :work_category
  
  def self.column_names_with_table
    self.column_names.map { |c| "#{table_name}.#{c}" }
  end

end
