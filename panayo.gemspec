# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'panayo/version'

Gem::Specification.new do |spec|
  spec.name          = "panayo"
  spec.version       = Panayo::VERSION
  spec.authors       = ["hogewest"]
  spec.email         = ["hogewest@gmail.com"]
  spec.summary       = %q{Hanayo is very cute.}
  spec.description   = %q{Hanayo is very cute.}
  spec.homepage      = "https://github.com/hogewest/panayo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", '>= 10.0'
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "coveralls"
end
