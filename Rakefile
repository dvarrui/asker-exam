# frozen_string_literal: true

desc 'Default action => check'
task default: :check do
end

desc 'Show rake help'
task :help do
  system('rake -T')
end

desc 'Build gem'
task :build do
  puts "[ INFO ] Building gem..."
  system('rm asker-exam-*.*.*.gem')
  system('gem build asker-exam.gemspec')
  puts "[ INFO ] Done"
end

desc 'Delete output files'
task :clean do
  OUTPUTDIR = 'output'
  FileUtils.rm_r OUTPUTDIR
  FileUtils.mkdir OUTPUTDIR
end

desc 'Check project files'
task :check do
  testfile = File.join('.', 'tests', 'all.rb')
  a = File.read(testfile).split("\n")
  b = a.select { |i| i.include? '_test' }

  d = File.join('.', 'tests', '**', '*_test.rb')
  e = Dir.glob(d)

  if b.size == e.size
    puts "[ OK ] All ruby tests executed by #{testfile}"
  else
    puts "[FAIL] Some ruby tests are not executed by #{testfile}"
  end

  puts "[INFO] Running #{testfile}"
  system(testfile)
end

desc 'Create launcher'
task :create_link do
  puts '[INFO] Creating symbolic link into /usr/local/bin'
  basedir = File.dirname(__FILE__)
  system("sudo ln -s #{basedir}/asker-exam /usr/local/bin/asker-exam")
end
