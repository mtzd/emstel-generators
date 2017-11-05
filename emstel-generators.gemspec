$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "emstel/generators/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "emstel-generators"
  s.version     = Emstel::Generators::VERSION
  s.authors     = ["emstel"]
  s.email       = ["me@emstel.de"]
  s.homepage    = "http://github.com/mtzd"
  s.summary     = "Some generators"
  s.description = "Some genrators"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
