require_relative 'lib/asker/exam/version'

Gem::Specification.new do |s|
  s.name = Asker::Exam::GEMNAME
  s.version = Asker::Exam::VERSION
  s.date = Time.now.strftime("%Y-%m-%d")
  s.summary = "Create exams from asker-tool questions (YAML file)"
  s.description = <<-EOF
  Create exams with questions from Asker YAML output file
  EOF

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
