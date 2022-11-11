require_relative 'lib/asker-quizzer/application'

Gem::Specification.new do |s|
  s.name        = Application::NAME
  s.version     = Application::VERSION
  s.date        = '2019-11-14'
  s.summary     = "AskerQuizzer create quizzes"
  s.description = <<-EOF
  AskerQuizzer create quizzes from questions Asker YAML input file
  EOF
  s.extra_rdoc_files = [ 'README.md' ]

  s.license     = 'GPL-3.0'
  s.authors     = ['David Vargas Ruiz']
  s.email       = 'asker.software@protonmail.com'
  s.homepage    = 'https://github.com/dvarrui/asker-quizzer'

  s.executables << 'asker-quizzer'
  s.files       = Dir.glob(File.join('lib','**','*.rb')) +
                  Dir.glob(File.join('docs','**','*.md'))

  s.add_runtime_dependency 'rainbow'
  s.add_runtime_dependency 'terminal-table'
  s.add_runtime_dependency 'thor'
end
