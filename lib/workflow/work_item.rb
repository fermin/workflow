require 'active_record'
class WorkItem < ActiveRecord::Base

  belongs_to :work_category
  
  def self.column_names_with_table
    self.column_names.map { |c| "#{table_name}.#{c}" }
  end

end
