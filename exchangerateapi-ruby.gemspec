# frozen_string_literal: true

require_relative "lib/exchangerateapi/version"

Gem::Specification.new do |spec|
  spec.name          = "exchangerateapi-ruby"
  spec.version       = Exchangerateapi::VERSION
  spec.authors       = ["exchangerateapinet"]
  spec.summary       = "Ruby client for exchangerateapi.net"
  spec.description   = "Lightweight wrapper offering access to latest and historical endpoints."
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.7"

  spec.files         = Dir["lib/**/*", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]
  spec.homepage      = "https://github.com/exchangerateapinet/exchangerateapi-ruby"
end
