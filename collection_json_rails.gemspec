# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'collection_json_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "collection_json_rails"
  spec.version       = CollectionJson::Rails::VERSION
  spec.authors       = ["Carles Jove i Buxeda"]
  spec.email         = ["hola@carlus.cat"]
  spec.summary       = %q{Collection+JSON Serializers with the Rails touch}
  spec.description   = %q{Adds Rails specific funcionalitaties for an enjoyable
  experience}
  spec.homepage      = "https://github.com/carlesjove/collection_json_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "collection_json_serializer", "~> 0.3.5"

  spec.add_dependency "actionpack", "~> 4.0"
  spec.add_dependency "railties", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
