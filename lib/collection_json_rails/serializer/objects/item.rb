class CollectionJson::Serializer::Objects::Item
  private

  def set_href
    Rails.application.routes.url_helpers.send(@serializer.items.href, @resource)
  end
end

