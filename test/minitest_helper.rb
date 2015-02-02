$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rails'
require 'action_controller'

require 'collection_json_rails'

require 'minitest/autorun'

module ActionController
  SharedTestRoutes = ActionDispatch::Routing::RouteSet.new
  SharedTestRoutes.draw do
    post ':controller(/:action)'
  end

  class Base
    include ActionController::Testing
    include SharedTestRoutes.url_helpers
  end

  class ActionController::TestCase
    setup do
      @routes = SharedTestRoutes
    end
  end
end

