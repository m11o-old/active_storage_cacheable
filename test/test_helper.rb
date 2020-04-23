require 'simplecov'
SimpleCov.start

if ENV['CODECOV_TOKEN']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rails'

require 'active_storage_cacheable'

require 'fake_app'
require 'test/unit/rails/test_help'

class ActiveStorageCacheableTestUnit < Test::Unit::TestCase
  class << self
    def shutdown
      FileUtils.rm_rf(Dir["#{Rails.root}/tmp/storage"])
      super
    end
  end

  def teardown
    User.destroy_all
    ActiveStorage::Blob.destroy_all

    super
  end
end

CreateUserTables.up unless ActiveRecord::Base.connection.table_exists? 'users'
