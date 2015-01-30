CollectionJson Rails
====================

This gem will add Rails specific features to [CollectionJson
Serializer](https://github.com/carlesjove/collection_json_serializer).

## Features

#### One step serialization:

```ruby
class PostsController < ApplicationController
  include CollectionJson::Rails::Render

  def index
    @posts = Post.all

    render json: @posts, status: :ok
  end
```

#### Parsing on incoming templates:

```ruby
class PostsController < ApplicationController
  private

  def post_params
    cj_template!(:post).permit(:title)
  end
```

#### Generators:

```bash
$ rails g cj:serializer post
# => app/serializers/post_serializer.rb
```

Wonder: should be invocated by scaffold, models, etc. generators?

#### URLs helpers

No more fighting with routes generation:

```ruby
class PostSerializer < CollectionJson::Serializer
  href :posts_url

  items do
    href :post_url, :self
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'collection_json_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install collection_json_rails


## Contributing

1. Fork it ( https://github.com/[my-github-username]/collection_json_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
