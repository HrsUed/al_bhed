require_relative 'lib/al_bhed/version'

Gem::Specification.new do |spec|
  spec.name          = "al_bhed"
  spec.version       = AlBhed::VERSION
  spec.authors       = ["HrsUed"]
  spec.email         = [""]

  spec.summary       = %q{Translator for Al Bhed language in FINAL FANTASY X}
  spec.description   = %q{Translator for Al Bhed language in FINAL FANTASY X}
  spec.homepage      = "https://github.com/HrsUed/al_bhed"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/HrsUed/al_bhed"
  spec.metadata["changelog_uri"] = "https://github.com/HrsUed/al_bhed/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
end
