class CollectionJson::Serializer
  include CollectionJson::Rails::Support

  def href
    method = self.class._href.first
    route(method)
  end

  def links
    self.class._links.map {|link| rewrite_href_of(link) }
  end
end

