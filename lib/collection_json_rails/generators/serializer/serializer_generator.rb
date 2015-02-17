require 'rails/generators'

module Rails
  module Generators
    class SerializerGenerator < NamedBase
      source_root File.expand_path("../templates", __FILE__)
      namespace "cj"

      argument :attributes, type: :array, default: [], banner: "field"

      def create_serializer
        template "serializer.rb",
                 File.join("app/serializers", class_path,
                 "#{file_name}_serializer.rb")
      end
    end
  end
end

