require_relative 'lib/asker/exam/version'

Gem::Specification.new do |s|
  s.name        = Version::GEMNAME
  s.version     = Version::VERSION
  s.summary     = "Create quizzes from asker-tool output (YAML)"
  s.description = <<-EOF
  Create quizzes from questions Asker YAML input file
  EOF

  s.license     = 'GPL-3.0'
  s.authors     = ['David Vargas Ruiz']
  s.email       = 'teuton.software@protonmail.com'
  s.homepage    = 'https://github.com/dvarrui/asker-exam'

  s.executables << Version::NAME
  s.files       = Dir.glob(File.join('lib','**','*.rb')) +
                  Dir.glob(File.join('docs','**','*.md'))

  s.add_runtime_dependency 'rainbow'
  s.add_runtime_dependency 'terminal-table'
  s.add_runtime_dependency 'thor'
end
