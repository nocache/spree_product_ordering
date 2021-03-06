# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_ordering'
  s.version     = '1.3'
  s.summary     = 'Product reordering extension for Spree 1.1.x'
  s.description = 'A simple extension that allows reordering products and variants.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Hugo Frappier'
  s.email     = 'hugo@godynamo.com'
  s.homepage  = 'http://www.godynamo.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.3'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sqlite3'
end
