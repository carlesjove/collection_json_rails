class UserSerializer < CollectionJson::Serializer
    items do
    attributes :first_name, :email
  end
  end

