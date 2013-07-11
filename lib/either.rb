module Either
  def match &block
    Match.new.tap { |m| block.call(m) }.evaluate(self)
  end
end

require 'optional'
require 'left'
require 'right'
require 'either/match'
