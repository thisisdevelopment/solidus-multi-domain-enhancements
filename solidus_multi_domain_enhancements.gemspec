# encoding: UTF-8
$:.push File.expand_path('./lib', File.dirname(__FILE__))
require 'solidus_multi_domain_enhancements/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_multi_domain_enhancements'
  s.version     = SolidusMultiDomainEnhancements::VERSION
  s.summary     = 'Add additional configuration to the MultiTenency Solidus install'
  s.description = s.summary
  s.license     = 'BSD-3-Clause'

  s.author    = 'Seb Ashton'
  s.email     = 'seb@madetech.com'
  s.homepage  = 'https://www.madetech.com'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus_core', '2.3.0'
  s.add_dependency 'solidus_multi_domain', '1.5.0'
  s.add_dependency 'tzinfo', '~> 1.1'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry'
end
