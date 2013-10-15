$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "paranoic/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "paranoic"
  s.version     = Paranoic::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Paranoic."
  s.description = "TODO: Description of Paranoic."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails', '~> 3.2.13'
  s.add_dependency 'haml-rails', '~> 0.4'
  s.add_dependency 'coffee-rails', '~> 3.2.2'
  s.add_dependency 'sass-rails', '~> 3.2.6'
  s.add_dependency 'active_model_serializers', '~> 0.8.1'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails', '~> 2.14.0'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'shoulda-matchers', '~> 2.2.0'
end
