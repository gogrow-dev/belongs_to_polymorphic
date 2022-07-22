# frozen_string_literal: true

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
  s.homepage      = 'https://gogrow.dev'
  s.required_ruby_version = '>= 2.5'

  s.metadata['source_code_uri'] = s.homepage
  s.metadata['rubygems_mfa_required'] = 'true'

  s.files = Dir['LICENSE.txt', 'README.md', 'lib/**/*']
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'activerecord', '>= 5.2', '< 8.0'
end
