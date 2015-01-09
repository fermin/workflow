require 'rails/generators/active_record'
require 'rails/generators/base'

class Workflow::MigrationGenerator < ::Rails::Generators::Base
    include Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)
    desc 'Installs Workflow migration file.'

    def install
      migration_template 'migration.rb', 'db/migrate/create_workflow.rb'
    end

    def self.next_migration_number(dirname)
      ActiveRecord::Generators::Base.next_migration_number(dirname)
    end

end

