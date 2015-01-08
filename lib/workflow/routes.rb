module Workflow
  class Routes
    module Helper
      def use_workflow(options = {}, &block)
        Workflow::Routes.new(self, &block).generate_routes!(options)
      end
    end

    def self.install!
      ActionDispatch::Routing::Mapper.send :include, Workflow::Routes::Helper
    end

    attr_accessor :routes

    def initialize(routes, &block)
      @routes, @block = routes, block
    end

    def generate_routes!(options)
      @mapping = Mapper.new.map(&@block)
      routes.scope options[:scope] || 'workflow', as: 'workflow' do
        map_route(:work_categories, :work_categories_routes)
        map_route(:work_items, :work_items_routes)
        map_route(:work_events, :work_events_routes)
      end
    end

    private

    def map_route(name, method)
      unless @mapping.skipped?(name)
        send method, @mapping[name]
      end
    end

    def work_categories_routes(mapping)
      routes.resources :workflow_work_categories, controller: mapping[:controllers], as: :work_categories, path: 'work_categories'
    end

    def work_items_routes(mapping)
      routes.resources :workflow_work_items, controller: mapping[:controllers], as: :work_items, path: 'work_items'
    end

    def work_events_routes(mapping)
      routes.resources :workflow_work_events, controller: mapping[:controllers], as: :work_events, path: 'work_events'
    end

  end
end
