module CollectionJson
  class Serializer
    class Items
      include CollectionJson::Rails::Support

      def link(hash)
        @links = Array.new unless @links.is_a?(Array)
        @links << rewrite_href_of(hash)
      end
    end
  end
end

