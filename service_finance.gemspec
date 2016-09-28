# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'service_finance/version'

Gem::Specification.new do |spec|
  spec.name          = "service_finance"
  spec.version       = ServiceFinance::VERSION
  spec.authors       = ["Joseph Tutela"]
  spec.email         = ["joseph.tutela@geostellar.com"]

  spec.summary       = "Access to Service Finance API"
  spec.homepage      = "https://github.com/geostellar/service_finance"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

end
