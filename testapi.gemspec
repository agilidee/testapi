$:.push File.expand_path("../lib", __FILE__)

require "testapi/version"

Gem::Specification.new do |s|
  s.name        = "testapi"
  s.version     = Testapi::VERSION
  s.authors     = ["agilidée"]
  s.email       = ["contact@agilidee.com"]
  s.homepage    = "https://github.com/agilidee/testapi"
  s.summary     = "A Test API"
  s.description = "A Test API"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
end
