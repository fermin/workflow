module Workflow
  module Generators
    class ViewsGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../../../app/views', __FILE__)

      desc 'Copies default Workflow views and layouts to your application.'

      def manifest
        directory 'workflow', 'app/views/workflow'
        directory 'layouts/workflow', 'app/views/layouts/workflow'
      end
    end
  end
end
