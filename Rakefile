# frozen_string_literal: true

OUTPUTDIR = 'output'

desc 'Default action => check'
task default: :check do
end

desc 'Show rake help'
task :help do
  system('rake -T')
end

def create_symbolic_link
  puts '[INFO] Creating symbolic link into /usr/local/bin'
  basedir = File.dirname(__FILE__)
  system("ln -s #{basedir}/asker-exam /usr/local/bin/asker-exam")
end

desc 'Delete output files'
task :clean do
  FileUtils.rm_r OUTPUTDIR
  FileUtils.mkdir OUTPUTDIR
  system("echo '*.*' > #{OUTPUTDIR}/.gitignore")
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

desc 'Build gem'
task :build do
  puts "[ INFO ] Building gem..."
  system('rm asker-exam-*.*.*.gem')
  system('gem build asker-exam.gemspec')
  puts "[ INFO ] Done"
end
