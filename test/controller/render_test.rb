require 'minitest_helper'

class PostsController < ActionController::Base
  def without_serializer
    render json: { my_hash: "should be jsonified too" }
  end

  def without_json
    render nothing: true
  end
end

class TestRender < ActionController::TestCase
  tests PostsController

  def test_that_objects_without_serializer_are_rendered_as_plain_json
    get :without_serializer

    assert_response :ok
  end

  def test_that_render_behaves_as_usual
    get :without_json

    assert_response :ok
  end
end

