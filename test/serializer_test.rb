require 'minitest_helper'

class TestRender < ActionController::TestCase
  tests PostsController

  def test_that_response_includes_urls
    expected = "http://test.com/posts"

    get :index, {}

    assert_equal expected, JSON.parse(response.body)["collection"]["href"]
  end

  def test_that_response_includes_items_url
    get :index, {}

    expected = "http://test.com/posts/my-pretty-url"
    actual = JSON.parse(response.body)["collection"]["items"][0]["href"]

    assert_equal expected, actual
  end
end

