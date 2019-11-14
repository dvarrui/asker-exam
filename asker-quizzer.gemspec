require_relative 'lib/asker-quizzer/application'

Gem::Specification.new do |s|
  s.name        = Application::NAME
  s.version     = Application::VERSION
  s.date        = '2019-11-08'
  s.summary     = "TeutonClient (Teuton Software)"
  s.description = "TeutonClient send evaluation requests to TeutonServer"

  s.license     = 'GPL-3.0'
  s.authors     = ['David Vargas Ruiz']
  s.email       = 'teuton.software@protonmail.com'
  s.homepage    = 'https://github.com/dvarrui/asker-quizzer'

  s.executables << 'quizzer'
  s.files       = %w[lib/teuton-client/files/teuton-client.yaml
                   lib/teuton-client/application.rb
                   lib/teuton-client/input_loader.rb
                   lib/teuton-client.rb]

  s.add_runtime_dependency 'rainbow', '~> 3.0'
  s.add_runtime_dependency 'terminal-table', '~> 3.0'
  s.add_runtime_dependency 'thor', '~> 3.0'
  s.add_development_dependency 'minitest', '~> 5.11'
end
