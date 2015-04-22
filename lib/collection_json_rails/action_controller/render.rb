module CollectionJson::Rails
  module Render

    def render(options)
      super options_for_render(options)
    end

    private

    def options_for_render(options)
      result = options
      if options[:json]
        result[:json] = serialize(options[:json])
        result[:status] = options[:status] || :ok
        if is_collection_json?(result[:json])
          result[:content_type] = CollectionJson::MIME_TYPE
        end
      end

      result
    end

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

    def is_collection_json?(hash)
      hash.key?(:collection) if hash.respond_to? :key
    end
  end
end

