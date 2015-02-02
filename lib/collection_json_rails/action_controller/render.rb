module CollectionJson::Rails
  module Render

    def render(options)
      resource = options.fetch(:json)
      status = options[:status] || :ok

      super json: serialize(resource), status: status
    end

    private

    def serialize(resource)
      serializer_class = serializer_class_of(resource)

      if serializer_class.respond_to?(:new)
        serializer = serializer_class.new(resource)
        collection = CollectionJson::Serializer::Builder.new(serializer)
        collection.pack
      else
        resource
      end
    end

    # This should probably live at CollectionJson::Serializer
    def serializer_for(resource)
      if resource.respond_to?(:to_ary)
        resource.first.class.name
      else
        resource.class.name
      end
    end

    def serializer_class_of(resource)
      resource_class = serializer_for(resource)
      "#{resource_class}Serializer".safe_constantize
    end
  end
end

