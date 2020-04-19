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

module DatabaseDeleter
  def setup
    User.delete_all
    ActiveStorage::Blob.delete_all
    ActiveStorage::Attachment.delete_all
    super
  end
end

Test::Unit::TestCase.send :prepend, DatabaseDeleter

CreateUserTables.up unless ActiveRecord::Base.connection.table_exists? 'users'
