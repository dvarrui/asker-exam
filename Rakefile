# frozen_string_literal: true

# File: Rakefile
# Usage: rake

def packages
  # p = %w[rainbow terminal-table thor inifile minitest]
  p = %w[rainbow terminal-table thor minitest]
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
