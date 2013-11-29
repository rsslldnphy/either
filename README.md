# either
### stop using exceptions for control flow with either types

[![Build Status](https://travis-ci.org/rsslldnphy/either.png)](https://travis-ci.org/rsslldnphy/either)
[![Code Climate](https://codeclimate.com/github/rsslldnphy/either.png)](https://codeclimate.com/github/rsslldnphy/either)

An `either` can hold one of two possible things - a typical example would be either the successful result of a computation or an error explaining what went wrong.

By convention, a `Left` holds an error, while a `Right` holds the result of a successful computation.

Here's a simple example:

    def divide x y
      y == 0 ? Left("Cannot divide by zero") : Right(x / y)
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

