class Workflow::InstallGenerator < ::Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)
  desc 'Installs Workflow.'

  def install
    copy_file File.expand_path('../../../../config/locales/zh.yml', __FILE__), 'config/locales/Workflow.zh.yml'
    route 'use_workflow'
    readme 'README'
  end
end
