
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "workado/version"

Gem::Specification.new do |spec|
  spec.name          = "workado"
  spec.version       = Workado::VERSION
  spec.authors       = ["Uysim"]
  spec.email         = ["uysimty@gmail.com"]

  spec.summary       = "workspace managment"
  spec.description   = "Manage user in workspace"
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/Uysim/workado"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir[
    "{app,config,lib}/**/*",
    "MIT-LICENSE",
    "Rakefile",
    "README.md"
  ]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "rails", ">= 5"
  spec.add_dependency "enumerize", ">= 2.3.1"

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
