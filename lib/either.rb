module Either
  attr_reader :value

  def match(&block)
    Match.new(self)._evaluate(&block)
  end
end
require 'optional'
require 'left'
require 'right'
require 'either/match'
