require 'active_record'
  class WorkEvent < ActiveRecord::Base

  	validates :event_name, :from, :to, presence: true

		belongs_to :work_category

		validate :check_from_to

		def check_from_to
			errors.add(:from, "From和To不能一样") if from == to
		end
		    
    def self.column_names_with_table
      self.column_names.map { |c| "#{table_name}.#{c}" }
    end

  end
