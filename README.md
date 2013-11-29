# either
### stop using exceptions for control flow with either types

[![Build Status](https://travis-ci.org/rsslldnphy/either.png)](https://travis-ci.org/rsslldnphy/either)
[![Code Climate](https://codeclimate.com/github/rsslldnphy/either.png)](https://codeclimate.com/github/rsslldnphy/either)
[![Coverage Status](https://coveralls.io/repos/rsslldnphy/either/badge.png)](https://coveralls.io/r/rsslldnphy/either)

An `either` can hold one of two possible things - a typical example would be either the successful result of a computation or an error explaining what went wrong.

By convention, a `Left` holds an error, while a `Right` holds the result of a successful computation.

Here's a simple example:

```ruby
def divide x y
  y == 0 ? Left["Cannot divide by zero"] : Right[x / y]
end

divide(4,2).match do |m|
  m.right { |res| puts "Division success: #{res}" }
  m.left  { |err| puts "Couldn't do this: #{err}" }
end
# The above will print "Division success: 2"

divide(4,0).match do |m|
  m.right { |res| puts "Division success: #{res}" }
  m.left  { |err| puts "Couldn't do this: #{err}" }
end
# The above will print "Couldn't do this: Cannot divide by zero"
```

When pattern-matching against an `Either` you can also assert on its content, either by value or by anything that matches it under `===`:

```ruby
divide(4,2).match do |m|
  m.right(0..2) { |res| puts "#{res} is between 0 and 2" }
  m.right(3..4) { |res| puts "#{res} is between 3 and 4" }
  m.left  { |err| puts "Couldn't do this: #{err}" }
end
```

If you need a catch-all clause, you can use the underscore wildcard:

```ruby
divide(4,2).match do |m|
  m.right(4..12) { |res| puts "This is never going to match"         }
  m.left         { |err| puts "But there hasn't been an error"       }
  m._            {       puts "So this catch-all clause will be run" }
end
```

If no match is found, a `BadMatchError` is raised.

You can also find out if what you have is a `Left` or `Right` using these predicate methods:

```ruby
Left[:foo].left?   # => true
Left[:foo].right?  # => false
Right[:foo].left?  # => false
Right[:foo].right? # => true

And you can get the value as an [option](https://github.com/rsslldnphy/optional) (depending on whether it is a `Left` or `Right`) like this:

Left[:foo].left   # => Some[:foo]
Left[:foo].right  # => None
Right[:foo].left  # => None
Right[:foo].right # => Some[:foo]
