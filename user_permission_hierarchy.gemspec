$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_permission_hierarchy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_permission_hierarchy"
  s.version     = UserPermissionHierarchy::VERSION
  s.authors     = ["Channa Ly"]
  s.email       = ["channa.info@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of UserPermissionHierarchy."
  s.description = "TODO: Description of UserPermissionHierarchy."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.5.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'mysql2', '~> 0.3.18'
  s.add_development_dependency 'annotate'
end
