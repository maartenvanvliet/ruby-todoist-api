# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'todoist/version'

Gem::Specification.new do |spec|
  spec.name          = "todoist-api"
  spec.version       = Todoist::VERSION
  spec.authors       = ["Maarten van Vliet"]
  spec.email         = ["maartenvanvliet@gmail.com"]
  spec.summary       = %q{Wrapper for todoist api.}
  spec.description   = %q{Wrapper for todoist api v6. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "webmock"
end
