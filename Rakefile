require 'rubygems'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

desc "Open a shell with local libraries loaded"
task :shell do
  exec "bundle exec irb -r url_hunter"
end

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = %w(-fs --color)
end

task :default => :spec
