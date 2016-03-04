# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "enigma/version"

Gem::Specification.new do |spec|
  spec.name          = "sofien-enigma"
  spec.version       = Enigma::VERSION
  spec.authors       = ["Ogbara Godwin"]
  spec.email         = ["godwin.onisofien@andela.com"]

  spec.summary       = "Enigma encryption machine."
  spec.description   = "use both key and date"
  spec.homepage      = "https://github.com/andela-gogbara/Enigma"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = %w(encrypt decrypt crack)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
