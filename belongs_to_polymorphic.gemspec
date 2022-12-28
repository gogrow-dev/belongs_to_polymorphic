# frozen_string_literal: true

require_relative 'lib/belongs_to_polymorphic/version'

Gem::Specification.new do |s|
  s.name          = 'belongs_to_polymorphic'
  s.version       = BelongsToPolymorphic::VERSION
  s.licenses      = ['MIT']
  s.authors       = ['Nicolas Erlichman']
  s.email         = ['hello@gogrow.dev']
  s.post_install_message = <<-MESSAGE
 !    The `belongs_to_polymoprhic` gem has been deprecated and has been replaced by `safe_polymorphic`.
 !    See: https://rubygems.org/gems/safe_polymorphic
 !    And: https://github.com/gogrow-dev/safe_polymorphic
  MESSAGE

  s.summary       = 'ActiveRecord extension - ' \
                    'Polymorphic associations with restricted allowed classes.'
  s.homepage      = 'https://github.com/gogrow-dev/belongs_to_polymorphic'
  s.required_ruby_version = '>= 2.5'

  s.metadata['source_code_uri'] = s.homepage
  s.metadata['source_code_uri'] = s.homepage
  s.metadata['changelog_uri'] = "#{s.homepage}/blob/master/CHANGELOG.md"
  s.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) ||
        f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  s.bindir = 'exe'
  s.executables = s.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'activerecord', '>= 5.2', '< 7.1'
end
