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

  s.license = "GPL-3.0"
  s.authors = ["David Vargas Ruiz"]
  s.email = "teuton.software@protonmail.com"
  s.homepage = Asker::Exam::HOMEPAGE

  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.executables << Asker::Exam::NAME
  s.files = Dir.glob(File.join("lib", "**", "*.*"))


  s.required_ruby_version = ">= 3.0"

  s.add_runtime_dependency 'colorize', "~> 1.1"       # ruby >= 2.6.0
  s.add_runtime_dependency "terminal-table", "~> 3.0" # ruby >= 0
  s.add_runtime_dependency "thor", "~> 1.2"           # ruby > 2.0.0
end
