module Workflow
  class WorkCategory < ActiveRecord::Base

    has_many :work_items
    has_many :work_events
    
    def self.column_names_with_table
      self.column_names.map { |c| "#{table_name}.#{c}" }
    end

  end
end
