module Workflow
  class Routes
    class Mapping
      attr_accessor :controllers, :as, :skips

      def initialize
        @controllers = {
          work_categories: 'workflow/work_categories',
          work_items: 'workflow/work_items',
          work_events: 'workflow/work_events'
        }

        @as = []

        @skips = []
      end

      def [](routes)
        {
          controllers: @controllers[routes],
          as: @as[routes]
        }
      end

      def skipped?(controller)
        @skips.include?(controller)
      end
    end
  end
end
