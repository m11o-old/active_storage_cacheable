
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_storage_cacheable/version"

Gem::Specification.new do |spec|
  spec.name          = "active_storage_cacheable"
  spec.version       = ActiveStorageCacheable::VERSION
  spec.authors       = ["m11o"]
  spec.email         = ["velonica2227@icloud.com"]

  spec.summary       = %q{add cache function on active_storage}
  spec.description   = %q{add cache function on active_storage}
  spec.homepage      = "https://github.com/m11o/active_storage_cacheable"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activestorage"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
end
