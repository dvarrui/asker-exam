# File: Rakefile

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

require "standard/rake"
task default: %i[test standard]
# task default: %i[test]

desc "Default: run tests"
task :default do
  Rake::Task["test"].invoke
end

desc "Show rake help"
task :help do
  system("rake -T")
end

desc "Delete output files"
task :clean do
  system("rm output/*")
end

desc "Create launcher"
task :create_link do
  puts "[INFO] Creating symbolic link into /usr/local/bin"
  basedir = File.dirname(__FILE__)
  system("sudo ln -s #{basedir}/asker-exam /usr/local/bin/asker-exam")
end
