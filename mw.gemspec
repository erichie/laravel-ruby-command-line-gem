# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mw/version'

Gem::Specification.new do |spec|
  spec.name          = "mw"
  spec.version       = Mw::VERSION
  spec.authors       = ["Edward Richards"]
  spec.email         = ["erichards@lingotek.com"]

  spec.summary       = %q{Manage Laravel environments.}
  spec.description   = %q{A tool for managing Laravel environments.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["mw"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
