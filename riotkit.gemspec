$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'riotkit/version'

Gem::Specification.new do |s|
  s.version = Riotkit::VERSION.dup
  s.name = 'riotkit'
  s.summary = 'Ruby toolkit for the Riot API'
  s.description = %q{Simple wrapper for the Riot API}
  s.authors = ['Jonas Fromell']
  s.email = ['jonas.per.fromell@gmail.com']

  s.files = Dir.glob('lib/**/*.rb')
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.0'
  s.add_development_dependency 'faraday', '~> 0.9.2'
end
