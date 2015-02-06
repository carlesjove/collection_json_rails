class TestApp < Rails::Application
  config.secret_key_base = "milo_goes_to_college"
end

Rails.application = TestApp

Rails.application.routes.default_url_options[:host] = "http://test.com"

Rails.application.routes.draw do
  resources :posts
end

class Post
  attr_accessor :title, :body

  def to_param
    "my-pretty-url"
  end
end

class PostSerializer < CollectionJson::Serializer
  items do
    href :post_url
    attributes :title, :body
  end

  href :posts_url
end

class PostsController < ActionController::Base
  include CollectionJson::Rails::Render

  def index
    post = Post.new
    post.title = "My title"
    post.body = "My first post"

    render json: post, status: :ok
  end
end


