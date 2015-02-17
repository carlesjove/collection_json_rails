require 'minitest_helper'
require 'rails/generators'

class SerializerGeneratorTest < Rails::Generators::TestCase
  destination File.expand_path("../tmp", __FILE__)
  setup :prepare_destination
  tests Rails::Generators::SerializerGenerator

  def test_that_a_serializer_is_generated
    run_generator %w(user)

    assert_file "app/serializers/user_serializer.rb",
                /class UserSerializer < CollectionJson::Serializer/
  end

  def test_that_attributes_can_be_passed
    run_generator %w(user first_name email)

    assert_file "app/serializers/user_serializer.rb" do |serializer|
      assert_match /items do/, serializer
      assert_match /attribute :first_name/, serializer
      assert_match /attribute :email/, serializer
      assert_match /end/, serializer
    end
  end

  def test_that_a_serializer_can_be_generated_in_a_namespace
    run_generator %w(admin/user)

    assert_file "app/serializers/admin/user_serializer.rb",
                /class Admin::UserSerializer < CollectionJson::Serializer/
  end
end

