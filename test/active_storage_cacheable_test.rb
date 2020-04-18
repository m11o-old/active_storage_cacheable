require "test_helper"

class ActiveStorageCacheableTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActiveStorageCacheable::VERSION
  end

  def test_it_does_something_useful
    assert_true true
  end
end
