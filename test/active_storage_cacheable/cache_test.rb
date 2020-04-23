require 'test_helper'

class CacheTest < ActiveStorageCacheableTestUnit
  setup do
    @user = User.create(name: "hoge")
    attach_avatar @user
  end

  test "test_cache!" do
    assert_true @user.avatar.attached?
  end
end
