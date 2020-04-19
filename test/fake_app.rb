ENV['RAILS_ENV'] ||= 'test'

require 'active_record'
require 'active_storage'
require 'active_storage/engine'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

module ActiveStorageCacheableTestApp
  class Application < ::Rails::Application
    config.eager_load = false
    config.root = File.dirname(__FILE__)
  end
end
ActiveStorageCacheableTestApp::Application.initialize!

# migrations
class CreateUserTables < ActiveRecord::VERSION::MAJOR >= 5 ? ActiveRecord::Migration[5.0] : ActiveRecord::Migration
  def self.up
    create_table(:users) { |t| t.string :name }

    create_table :active_storage_blobs do |t|
      t.string   :key,          null: false
      t.string   :filename,     null: false
      t.string   :content_type
      t.text     :metadata
      t.string   :service_name, null: false
      t.bigint   :byte_size,    null: false
      t.string   :checksum,     null: false
      t.datetime :created_at,   null: false

      t.index [:key], unique: true
    end

    create_table :active_storage_attachments do |t|
      t.string     :name,     null: false
      t.references :record,   null: false, polymorphic: true, index: false
      t.references :blob,     null: false

      t.datetime :created_at, null: false

      t.index [:record_type, :record_id, :name, :blob_id], name: "index_active_storage_attachments_uniqueness", unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
  end
end

class User < ActiveRecord::Base
  has_one_attached :avatar
  has_many_attached :images
end
