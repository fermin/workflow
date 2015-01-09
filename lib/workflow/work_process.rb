require 'active_record'
class WorkProcess < ActiveRecord::Base
	belongs_to :target, polymorphic: true
end