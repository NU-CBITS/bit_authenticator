$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'bit_authenticator/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'bit_authenticator'
  s.version     = BitAuthenticator::VERSION
  s.authors     = ['Eric Carty-Fickes']
  s.email       = ['ericcf@northwestern.edu']
  s.homepage    = 'https://github.com/cbitstech/bit_authenticator'
  s.summary     = 'Authentication related functionality for BIT projects.'
  s.description = 'Authentication related functionality for BIT projects.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile',
                'README.md']

  s.add_dependency 'rails', '~> 4.1.6'

  s.add_development_dependency 'rspec-rails', '~> 3'
end
