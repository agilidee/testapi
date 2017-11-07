$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "testapi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "testapi"
  s.version     = Testapi::VERSION
  s.authors     = ["agilidée"]
  s.email       = ["contact@agilidee.com"]
  s.homepage    = "https://github.com/agilidee/testapi"
  s.summary     = "The Test API"
  s.description = "The Test API"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"
end
