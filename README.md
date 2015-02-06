Collection+Json Rails
====================

Add Rails specific features to [CollectionJson
Serializer](https://github.com/carlesjove/collection_json_serializer).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'collection_json_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install collection_json_rails


That's all you need. CollectionJson::Serializer is included ;-)

## Usage

You just need to create serializers for your models. Here's an example:

```ruby
class PostSerializer < CollectionJson::Serializer
  items do
    attributes :title, :body
  end

  template :title, :body
end
```

#### Responding with Collection+JSON

Now you can respond with Collection+JSON using the regular `render`:

```ruby
class PostsController < ApplicationController
  include CollectionJson::Rails::Render

  def index
    @posts = Post.all

    render json: @posts, status: :ok
  end
end
```


#### Accepting templates:

Collection+JSON supports write templates (YEAH!). You can accept them easily by using `accept_template!` in a similar fashion as you'd use strong parameters.

`accept_template!` takes one argument: the name of the model (that's what you'd usually pass to `require` when using strong parameters). Then, you can proceed as usual and whitelist attributes with `permit`.

Note: Noticed the exclamation mark? This means that `accept_template!` rewrites
`params`. Should `params[:model]` be present, it'd be rewritten with template's
attributes. All other attributes of `params` are untouched.

```ruby
class PostsController < ApplicationController
  include CollectionJson::Rails::AcceptTemplate

  private

  def post_params
    accept_template!(:post).permit(:title, :body)
  end
```

#### Generators:

`$ rails g cj serializer post title body`

```ruby
# app/serializers/post_serializer.rb

class PostSerializer < CollectionJson::Serializer
  items do
    attributes :title, :body
  end
end
```

#### URL helpers

Getting routes in your serializers is easy as shit. Simply pass the method name as a symbol. No need to reference the object.

```ruby
class PostSerializer < CollectionJson::Serializer
  href :posts_url

  items do
    href :post_url
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/collection_json_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
