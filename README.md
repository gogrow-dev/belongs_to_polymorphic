# Belongs to Polymorphic

An ActiveRecord extension defining the concept *belongs to polymorphic*, which allows us to use polymorphic associations (belongs_to) and restrict which classes are allowed to be related to.


The base idea and code was taken from this blogpost: [Improve ActiveRecord Polymorphic Associations - Head of engineering at Product Hunt](https://blog.rstankov.com/allowed-class-names-in-activerecord-polymorphic-associations/).

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
    belongs_to_polymorphic :owner, allowed_classes: [Person, Publisher]
end
```

You can also add any options that a regular `belongs_to` with `polymorphic: true` could use.

By using this you create a polymorphic relationship in `Book` called `contents` which can be a `Person` or a `Publisher`.
If you try to set an `owner` from a class rather than the aforementioend ones, it will return the following error:
```ruby
#<ActiveModel::Error attribute=profile_type, type=inclusion, options={:value=>"IncorrectModel"}>
```

It also automatically adds some helpers

Class:
- `Book.owner_types`: returns the allowed classes
- `Book.with_owner(#{type})`: generic finder method
- `Book.with_owner_#{allowed_class_name}`: scope for each allowed class

Instance:
-  `book.owner_type_#{allowed_class_name}?`: check if it is from that specific class


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
