# -*- encoding: utf-8 -*-
require File.expand_path('../lib/aloha/rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Kurakin Alexander']
  gem.email         = 'kuraga333@mail.ru'
  gem.description   = 'Aloha Editor in Rails'
  gem.summary       = 'Provides the Aloha Editor for your Rails app'
  gem.homepage      = 'https://github.com/kuraga/aloha-rails-improved'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.name          = 'aloha-rails-improved'
  gem.require_paths = ['lib']
  gem.version       = Aloha::Rails::VERSION

  gem.add_dependency 'activesupport', '>= 3.0'
  gem.add_dependency 'actionpack', '>= 3.0'

  gem.add_development_dependency 'rspec', '~> 2.12'
  gem.add_development_dependency 'rspec-rails', '~> 2.12'
  gem.add_development_dependency 'rake', '~> 10.0'
end
