require_relative 'lib/simple/search/version'

Gem::Specification.new do |spec|
  spec.name          = "simple-search"
  spec.version       = Simple::Search::VERSION
  spec.authors       = ["Adam Stokes"]
  spec.email         = ["51892+adam-stokes@users.noreply.github.com"]

  spec.summary       = %q{A simple search index}
  spec.description   = %q{A simple search index}
  spec.homepage      = "https://github.com/adam-stokes/simple-search-rb"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/adam-stokes/simple-search-rb"
  spec.metadata["changelog_uri"] = "https://github.com/adam-stokes/simple-search-rb"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
