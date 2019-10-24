# frozen_string_literal: true

# File: Rakefile
# Usage: rake

OUTPUTDIR = 'output'

def packages
  # p = %w[rainbow terminal-table thor inifile minitest]
  %w[rainbow terminal-table thor minitest]
end

# Define tasks
desc 'Default action => check'
task default: :check do
end

desc 'Show Quizz Rake help'
task :help do
  system('rake -T')
end

desc 'Update Quizz'
task :update do
  puts '[INFO] Updating Quizzes...'
  system('git pull')
  install_gems packages
end

def create_symbolic_link
  puts '[INFO] Creating symbolic link into /usr/local/bin'
  basedir = File.dirname(__FILE__)
  system("ln -s #{basedir}/quizz /usr/local/bin/quizz")
end

desc 'Delete output files'
task :clean do
  FileUtils.rm_r OUTPUTDIR
  FileUtils.mkdir OUTPUTDIR
  system("echo '*.*' > #{OUTPUTDIR}/.gitignore")
end

desc 'Check project files'
task :check do
  fails = filter_uninstalled_gems(packages)
  if fails.size.zero?
    puts '[ OK ] Gems installed OK!'
  else
    puts '[FAIL] Gems not installed!: ' + fails.join(',')
  end

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
  system('./quizzer version')
end

def filter_uninstalled_gems(list)
  cmd = `gem list`.split("\n")
  names = cmd.map { |i| i.split(' ')[0] }
  fails = []
  list.each { |i| fails << i unless names.include?(i) }
  fails
end
