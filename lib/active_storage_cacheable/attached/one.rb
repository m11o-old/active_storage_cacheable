module ActiveStorageCacheable
  module Attached::One
    attr_accessor :cache_name

    def cache!
      return unless attached?

      attachment.blob.save!
      change&.upload

      self.cache_name = attachment.blob.key
    end

    def retrieve_from_cache!(cache_name = self.cache_name)
      blob = ActiveStorage::Blob.find_by(key: cache_name)
      return if blob.blank?

      self.cache_name = cache_name
      attach blob
    end

    def purge_cache!(cache_name = self.cache_name)
      blob = ActiveStorage::Blob.find_by(key: cache_name)
      return if blob.blank?

      self.cache_name = nil
      blob.purge
    end

    def cached?
      cache_name.present?
    end
  end
end
