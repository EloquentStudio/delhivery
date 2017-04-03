# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delhivery/version'

Gem::Specification.new do |spec|
  spec.name          = "delhivery"
  spec.version       = Delhivery::VERSION
  spec.authors       = ["Spidergears"]
  spec.email         = ["findspidergears@gmail.com"]

  spec.summary       = %q{Ruby gem for Delhivery REST API}
  spec.description   = %q{Ruby gem for Delhivery REST API}
  spec.homepage      = "https://github.com/spidergears/delhivery"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'multi_json'
  spec.add_dependency 'null_logger'
  spec.add_dependency "hashie"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", '~> 3.0', '>= 3.0.3'
  spec.add_development_dependency "pry", "~> 0.10.3"
  spec.add_development_dependency "pry-nav", "~> 0.2.4"
  spec.add_development_dependency "coveralls", "~> 0.8.19"
end
