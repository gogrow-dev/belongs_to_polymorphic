## [Unreleased]

## [0.1.1] - 2022-03-14

- Initial release

## [0.1.2] - 2022-07-20

- Added necessary specs

## [0.1.3] - 2022-07-20

- Fixed issue with I18n load path

## [0.2.0] - 2022-12-27

- This version is a refactor with a breaking change into how the gem is used.

### Breaking Changes

- Drop usage of the keyword `belongs_to_polymorphic` in favor of `belongs_to`.
- Drop usage of the option `allowed_classes` in favor of reusing the `polymorphic` option.
- As an example, in previous versions, you would have:

```ruby
class User < ApplicationRecord
  belongs_to_polymorphic :profile, allowed_classes: [Person, Company]
end
```
Whereas in this version, you would have:

```ruby
class User < ApplicationRecord
  belongs_to :profile, polymorphic: [Person, Company]
end
```

## [0.2.1] - 2022-12-27

- Fixed bundled gem size
