require_relative 'lib/belongs_to_polymorphic/version'

Gem::Specification.new do |s|
  s.name          = 'belongs_to_polymorphic'
  s.version       = BelongsToPolymorphic::VERSION
  s.platform      = Gem::Platform::RUBY
  s.licenses      = ['MIT']
  s.summary       = 'ActiveRecord extension - ' \
                    'Polymorphic associations with restricted allowed classes.'
  s.description   = s.summary
  s.authors       = ['Nicolas Erlichman']
  s.email         = ['hello@gogrow.dev']
  s.homepage      = 'https://github.com/gogrow-dev/belongs_to_polymorphic'

  s.metadata['source_code_uri'] = s.homepage
  s.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files = Dir['LICENSE.txt', 'README.md', 'lib/**/*']
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_development_dependency 'activerecord', '>= 5.0.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov', '~> 0.17.1'

  s.add_runtime_dependency 'activerecord', '>= 5.2', '< 8.0'
end
