# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pretty_id/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alex Agranov"]
  gem.email         = ["alex@morphogenic.net"]
  gem.description   = %q{Make long decimal or hexadecimal IDs pretty again by shortening via conversion to base34}
  gem.summary       = %q{By leveraging base34 - [0-9, A-Z minus I & O] - we can significantly reduce the number of characters used to represent a number.  For instance, a 24-digit base10 number can be represented with just 16 digits in base34.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "pretty_id"
  gem.require_paths = ["lib"]
  gem.version       = PrettyId::VERSION

  gem.add_development_dependency 'bundler', '~> 1.3'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
