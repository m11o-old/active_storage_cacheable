module ActiveStorageCacheable
  class Railtie < ::Rails::Railtie
    initializer 'active_storage_cacheable' do
      ActiveSupport.on_load :active_storage_blob do
        require 'active_storage_cacheable/cache'
        ActiveStorage::Attached.send :prepend, ActiveStorageCacheable::Cache
      end
    end
  end
end
