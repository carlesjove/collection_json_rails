class <%= class_name %>Serializer < CollectionJson::Serializer
  <% if attributes.any? -%>
  items do
    attributes <%= item_attributes.join(', ') %>
  end
  <% end -%>
end

