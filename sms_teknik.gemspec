# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sms_teknik/version'

Gem::Specification.new do |spec|
  spec.name          = "sms_teknik"
  spec.version       = SmsTeknik::VERSION
  spec.authors       = ["Standout AB"]
  spec.email         = ["kontakt@standout.se"]

  spec.summary       = %q{SMS Gateway client for SMS Teknik}
  spec.description   = %q{Need to send an SMS with SMS Teknik? Then this is the
    Gem for you. We only implemented the gateway calls we need for now. But
    keep in mind that it's open source and you can help us improve the gem and
    make it more feature complete.}
  spec.homepage      = "https://github.com/standout/sms_teknik"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.1.0"
end
