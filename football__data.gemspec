# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'football__data/version'

Gem::Specification.new do |spec|
  spec.name          = "football__data"
  spec.version       = FootballData::VERSION
  spec.authors       = ["delta"]
  spec.email         = ["delta4d@gmail.com"]
  spec.license       = 'MIT'

  spec.summary       = %q{ruby api wrapper of football-data.org}
  spec.description   = %q{ruby api wrapper of football-data.org}
  spec.homepage      = "https://github.com/delta4d/football-data"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["football"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "thor", "~> 0.19"
end
