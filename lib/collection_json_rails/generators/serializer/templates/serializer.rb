class <%= class_name %>Serializer < CollectionJson::Serializer
  <% if attributes.any? -%>
  items do
    <% attributes.each do |attr| %>
    attribute <%= ":#{attr.name}" %>
    <% end %>
  end
  <% end -%>
end

