require "active_storage_cacheable/version"

begin
  require 'rails'
  require 'active_storage_cacheable/railtie'
rescue LoadError
end

module ActiveStorageCacheable
end
