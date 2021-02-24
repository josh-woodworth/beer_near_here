
require_relative "lib/beer_near_here/version"

Gem::Specification.new do |spec|
  spec.name          = "beer_near_here"
  spec.version       = BeerNearHere::VERSION
  spec.authors       = ["Josh Woodworth"]
  spec.email         = ["josh.woodworth3@gmail.com"]

  spec.summary       = "A CLI program that will search an API database to find breweries in states that are searched."
  spec.homepage      = "https://github.com/josh-woodworth/beer_near_here.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/josh-woodworth/beer_near_here.git"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/josh-woodworth/beer_near_here.git"
  spec.metadata["changelog_uri"] = "https://github.com/josh-woodworth/beer_near_here.git"

  # Specify which files should be added to the gem when it is released. 
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_dependency 'httparty'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
