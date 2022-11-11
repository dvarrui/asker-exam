require_relative 'lib/asker-exam/application'

Gem::Specification.new do |s|
  s.name        = Version::NAME
  s.version     = Version::VERSION
  s.date        = '2019-11-14'
  s.summary     = "Asker-exam create quizzes from asker-tool output"
  s.description = <<-EOF
  AskerQuizzer create quizzes from questions Asker YAML input file
  EOF

  s.license     = 'GPL-3.0'
  s.authors     = ['David Vargas Ruiz']
  s.email       = 'asker.software@protonmail.com'
  s.homepage    = 'https://github.com/dvarrui/asker-exam'

  s.executables << Version::GEMNAME
  s.files       = Dir.glob(File.join('lib','**','*.rb')) +
                  Dir.glob(File.join('docs','**','*.md'))

  s.add_runtime_dependency 'rainbow'
  s.add_runtime_dependency 'terminal-table'
  s.add_runtime_dependency 'thor'
end
