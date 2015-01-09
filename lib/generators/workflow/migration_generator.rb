require 'rails/generators/active_record'

module Workflow
  module Generators
    class MigrationGenerator < Rails::Generators::Base

      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc 'Installs Workflow migration file.'

      def install
        migration_template 'migration.rb', 'db/migrate/create_workflow_tables.rb'
      end

    end
  end
end

