require 'minitest_helper'

class TestSerializer < ActionController::TestCase
  tests PostsController

  def test_that_cj_responses_are_as_expected
    expected = {
      collection: {
        version: "1.0",
        href: "http://test.com/posts",
        items: [
          {
            href: "http://test.com/posts/my-pretty-url",
            data: [
              { name: "title", value: "My title" },
              { name: "body", value: "My first post" }
            ],
            links: [
              { rel: "posts", href: "http://test.com/posts", name: "posts" },
              { rel: "external", href: "http://example.com", name: "external" }
            ]
          }
        ],
        links: [
          { rel: "posts", href: "http://test.com/posts", name: "posts" },
          { rel: "external", href: "http://example.com", name: "external" }
        ]
      }
    }

    get :index, {}

    assert_equal expected.to_json, response.body
  end
end

