$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "test-unit"

require "rails"
require "active_storage_cacheable"

Bundler.require

require "test/unit/rails/test_help"
