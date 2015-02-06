class CollectionJson::Serializer
  include CollectionJson::Rails::Support

  def href
    method = self.class.href.first
    route(method)
  end

  def links
    self.class.links.map {|link| rewrite_href_of(link) }
  end
end

