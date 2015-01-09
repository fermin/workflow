module Workflow
  class Engine < ::Rails::Engine
    initializer 'workflow.routes' do
      Workflow::Rails::Routes.install!
    end
  end
end
