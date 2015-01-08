module Workflow
  class Engine < Rails::Engine
    initializer 'workflow.routes' do
      Doorkeeper::Routes.install!
    end
  end
end
