require 'pp'
module Workflow
	module Transition

		extend ActiveSupport::Concern

		included do
			has_many :work_processes
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
			    			WorkProcess.create tar
	  					end  
			    	end
		    	RUBY
				end

			end
    end





			# state_machine do
	  #   state :new, display: "新建" 
	  #   state :need_approval, display: "待审核"
	  #   state :approval_pass, display: "审核通过"
	  #   state :released, display: "已发布"

	  #   event :apply_approval do
	  #   	transitions to: :need_approval, from: [:new, :approval_not_pass], on_transition: :set_apply_approval
	  #   end

	  #   event :approval_pass do
	  #     transitions from: :need_approval, to: :approval_pass, on_transition: :set_approval_pass
	  #   end

	  #   # event :approval_not_pass do
	  #   #   transitions from: :need_approval, to: :approval_not_pass
	  #   # end

	  #   event :release do
	  #     transitions from: :approval_pass, to: :released, on_transition: :set_release
	  #   end
	  # end

	  # EmPackage.state_machine.events.keys.each do |method_name|
	  # 	method = method_name.to_s
	  # 	define_method "set_" + method do |*args|
	  # 		self.comments.build user: args[0], comment: args[1]
	  # 	end
	  # end

	   #  class_eval <<-RUBY
				# state_machine do
				# 	work_category.work_items.each do |state|
				# 		state state.action.to_sym, display: state.display
				# 	end
				# end
	   #  RUBY

	end
end