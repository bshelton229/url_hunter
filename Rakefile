require "bundler/gem_tasks"

desc "Open a shell with local libraries loaded"
task :shell do
  exec "irb -I #{File.expand_path('../lib', __FILE__)} -r url_hunter"
end
