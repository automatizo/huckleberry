# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'huckleberry/version'

Gem::Specification.new do |spec|
  spec.name          = "huckleberry"
  spec.version       = Huckleberry::VERSION
  spec.authors       = ["Justin Kuepper"]
  spec.email         = ["justin.kuepper@gmail.com"]

  spec.summary       = %q{Easy access to nutritional data.}
  spec.description   = %q{Simplified nutritional database generator for Rails.}
  spec.homepage      = "http://kuepper.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord", ">= 3.0.0"
  spec.add_runtime_dependency "rubyzip"
  spec.add_runtime_dependency "faraday"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "pg"
  spec.add_development_dependency "sqlite3"
end
