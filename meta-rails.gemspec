# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meta/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'meta-rails'
  spec.version       = Meta::Rails::VERSION
  spec.authors       = ['Dmitriy Tarasov']
  spec.email         = ['info@rubysamurai.com']

  spec.summary       = 'Meta tags helpers for search engine optimization (SEO)'
  spec.description   = 'Meta tags helpers to improve search engine optimization (SEO) of Rails application'
  spec.homepage      = 'https://github.com/rubysamurai/meta-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency 'rspec-rails', '>= 3.5'
end
