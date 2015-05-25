# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mock_java/version'

Gem::Specification.new do |spec|
  spec.name          = 'mock_java'
  spec.version       = MockJava::VERSION
  spec.authors       = ['Frederico Benevides']
  spec.email         = ['fredbene@gmail.com']

  spec.summary       = 'Mock java is a lib to mock java classes in the ruby world!'
  spec.description   = 'mock_java a lib that help to mock java classes in ruby world!'

  spec.homepage      = 'http://github.com/fredericobenevides/mock_java'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = `git ls-files -- spec`.split("\n")
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
