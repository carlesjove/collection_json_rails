module CollectionJson::Rails
  module Render

    def render(options)
      resource = options.fetch(:json)
      status = options.fetch(:status) || :ok

      super json: serialize(resource), status: status
    end

    private

    def serialize(resource)
      resource_class = serializer_for(resource)
      serializer_class = "#{resource_class}Serializer".safe_constantize

      serializer = serializer_class.new(resource)
      collection = CollectionJson::Serializer::Builder.new(serializer)
      collection.pack
    end

    # This should probably live at CollectionJson::Serializer
    def serializer_for(resource)
      if resource.respond_to?(:to_ary)
        resource.first.class.name
      else
        resource.class.name
      end
    end
  end
end

