# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'password_control/version'

Gem::Specification.new do |spec|
  spec.name          = "password_control"
  spec.version       = PasswordControl::VERSION
  spec.authors       = ["Giovani Ferreira"]
  spec.email         = ["silva.giovanif@gmail.com"]

  spec.summary       = %q{A high level ruby library for manage and secure passwords}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/giovanifss/PasswordControl"
  spec.license	     = "LGPL"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "coveralls"
  spec.add_dependency "scrypt", "~> 2.0.2"
  spec.add_dependency "bcrypt", "~> 3.1.5"

end
