# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snag/version'

Gem::Specification.new do |spec|
  spec.name          = "snag"
  spec.version       = Snag::VERSION
  spec.authors       = ["Joseph McCormick"]
  spec.email         = ["esmevane@gmail.com"]

  spec.summary       = %q{Snag desired files from a Github repo}
  spec.description   = %q{Read a snagfile, snag files; can't explain that}
  spec.homepage      = "https://github.com/esmevane/snag"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |file|
    file.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "github_api", "0.13.1"
  
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
