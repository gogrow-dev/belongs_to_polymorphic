# Belongs to Polymorphic

An ActiveRecord extension defining the concept *belongs to polymorphic*, which allows us to use polymorphic associations (belongs_to) and restrict which classes are allowed to be related to.


The base idea was taken from this blogpost: [Improve ActiveRecord Polymorphic Associations - Head of engineering at Product Hunt](https://blog.rstankov.com/allowed-class-names-in-activerecord-polymorphic-associations/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'belongs_to_polymorphic'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install belongs_to_polymorphic

## Usage

In your model you can do the following:

```ruby
class Book < ActiveRecord::Base
    belongs_to_polymorphic :owner, allowed_classes: [User, Publisher]
end
```

You can also add any options that a regular `belongs_to` with `polymorphic: true` could use.

By using this you create a polymorphic relationship in `Book` called `owner` which can be a `User` or a `Publisher`.
If you try to set an `owner` from a class rather than the aforementioend ones, it will return the following error:
```ruby
#ActiveRecord::RecordInvalid: Validation failed: Owner type OtherThing class is not an allowed class.
```

It also automatically adds some helpers

Class:
- `Book.owner_types`: returns the allowed classes
- `Book.with_owner(#{type})`: generic finder method
- `Book.with_owner_#{allowed_class_name}`: scope for each allowed class

Instance:
-  `book.owner_type_#{allowed_class_name}?`: check if it is from that specific class

### Usage with namespaced models

```ruby
class Book < ActiveRecord::Base
    belongs_to_polymorphic :owner, allowed_classes: [Publisher::User, Publisher]
end
```

It will allow you to use:
- `Book.with_owner(Publisher::User)`
- `Book.with_owner_publisher_user`
- `book.owner_type_publisher_user?`

## I18n

Belongs to Polymoprhic uses I18n to define the not allowed class error. To customize it, you can set up your locale file:

```yaml
en:
  belongs_to_polymoprhic:
    errors:
      messages:
        class_not_allowed: "%{class} is not an allowed class"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gogrow-dev/belongs_to_polymorphic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/gogrow-dev/belongs_to_polymorphic/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the belongs_to_polymorphic project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/gogrow-dev/belongs_to_polymorphic/blob/main/CODE_OF_CONDUCT.md).

## Credits

belongs_to_polymorphic is maintained by [GoGrow](https://gogrow.dev) with the help of our
[contributors](https://github.com/gogrow-dev/belongs_to_polymorphic/contributors).

[<img src="https://user-images.githubusercontent.com/9309458/180014465-00477428-fd76-48f6-b984-5b401b8ce241.svg" height="50"/>](https://gogrow.dev)
