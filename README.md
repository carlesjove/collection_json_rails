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

