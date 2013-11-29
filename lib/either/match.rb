class Either::Match
  def initialize(either)
    @_either ||= either
  end

  def _evaluate
    yield self
    _result or fail BadMatchError, _either
  end

  def right(match = always, &block)
    @_result ||= block.call(_either.value) if _either.right.grep(match).some?
  end

  def left(match = always, &block)
    @_result ||= block.call(_either.value) if _either.left.grep(match).some?
  end

  def _(&block)
    @_result ||= block.call
  end

  private
  attr_reader :_either, :_result

  def always
    ->(x) { true }
  end

  def method_missing(name, *args, &block)
    # swallow everything for compatibility with id
  end

end

class BadMatchError < StandardError
  def initialize(value)
    super "No match for value: #{value.inspect}"
  end
end
