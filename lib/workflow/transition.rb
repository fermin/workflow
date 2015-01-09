module Workflow
	module Transition

		extend ActiveSupport::Concern

		included do
			has_many :work_processes, as: :target
			
			@@work_category = WorkCategory.find_by(name: self.to_s)

			if @@work_category
				include ActiveModel::Transitions

				class_eval <<-RUBY
					state_machine attribute_name: @@work_category.column_name.to_sym do
						@@work_category.work_items.each do |state|
							state state.action.to_sym, display: state.display
						end

						@@work_category.work_events.each do |event|
							event event.event_name.to_sym do
								if event.on_transitions.present?
									transitions from: event.from.split(','), to: event.to.to_sym, on_transition: event.on_transitions.to_sym
								else
									transitions from: event.from.split(','), to: event.to.to_sym
								end
							end
						end
					end
		    RUBY

		    @@work_category.work_events.where("on_transitions is not null").each do |work_event|
		    	class_eval <<-RUBY
			    	unless self.method_defined? work_event.on_transitions.to_sym
			    		define_method work_event.on_transitions.to_sym do |*args|  
			    			WorkProcess.create target: self, event_name: work_event.event_name, event_from: work_event.from, event_to: work_event.to, user_id: args[0], next_user_id: args[1], comment: args[2]
	  					end  
			    	end
		    	RUBY
				end

			end
    end

	end
end