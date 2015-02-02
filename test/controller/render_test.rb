require 'minitest_helper'

class Post
  attr_accessor :title, :body
end

class PostSerializer < CollectionJson::Serializer
  items do
    attributes :title, :body
  end
end

class PostsController < ActionController::Base
  include CollectionJson::Rails::Render

  def index
    post = Post.new
    post.title = "My title"
    post.body = "My first post"

    render json: post, status: :ok
  end

  def without_serializer
    render json: { my_hash: "should be jsonified too" }
  end

  def without_json
    render nothing: true
  end
end

class TestRender < ActionController::TestCase
  tests PostsController

  def test_that_cj_responses_are_rendered
    expected = {
      collection: {
        version: "1.0",
        items: [
          {
            data: [
              { name: "title", value: "My title" },
              { name: "body", value: "My first post" }
            ]
          }
        ]
      }
    }

    get :index, {}

    assert_equal expected.to_json, response.body
  end

  def test_that_objects_without_serializer_are_rendered_as_plain_json
    get :without_serializer

    assert_response :ok
  end

  def test_that_render_behaves_as_usual
    get :without_json

    assert_response :ok
  end
end

