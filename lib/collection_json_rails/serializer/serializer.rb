class CollectionJson::Serializer
  def href
    method = self.class.href.first
    Rails.application.routes.url_helpers.send(method)
  end
end

