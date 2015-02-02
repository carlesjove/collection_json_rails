require 'minitest_helper'

class PostsController < ActionController::Base
  include CollectionJson::Rails::AcceptTemplate

  def create
    accept_template!(:post).permit(:title, :body)
    head :ok
  end
end

class TestAcceptTemplate < ActionController::TestCase
  tests PostsController

  def setup
    @template = {
      template: {
        data: [
          { name: "title", value: "My Post Title" },
          { name: "body", value: "This is my first Post" }
        ]
      }
    }
  end

  def test_that_incoming_templates_are_accepted
    post :create, @template

    assert_response :ok
  end
end

