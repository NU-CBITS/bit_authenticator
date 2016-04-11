# frozen_string_literal: true
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'BitAuthenticator'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

Dir[File.join(File.dirname(__FILE__), 'tasks/**/*.rake')].each { |f| load f }

require 'rubocop/rake_task'

RuboCop::RakeTask.new

desc 'Run Brakeman'
task :brakeman do
  dir = File.dirname(__FILE__)
  puts `#{ File.join(dir, 'bin', 'brakeman') } #{ File.join(dir, '.') }`
end

require 'rspec/core'
require 'rspec/core/rake_task'

desc 'Run all Ruby specs'
RSpec::Core::RakeTask.new

task :default do
  Rake::Task['rubocop'].invoke
  Rake::Task['brakeman'].invoke
  Rake::Task['spec'].invoke
end
