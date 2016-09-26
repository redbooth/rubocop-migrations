# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/migrations/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-migrations'
  spec.version       = Rubocop::Migrations::VERSION

  spec.authors       = %w(enricostano magec)
  spec.email         = %w(ocirne.onats@gmail.com joseferper@gmail.com)

  spec.summary       = 'Rails migrations rubocop checks'
  spec.description   = 'Performs some checks for migration sanity'
  spec.homepage      = 'https://github.com/redbooth/rubocop-migrations'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) } # rubocop:disable Metrics/LineLength
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rubocop', '~> 0.41.0'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '3.5.0'
end
