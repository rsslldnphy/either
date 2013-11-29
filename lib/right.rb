class Right
  include Either

  def initialize(value)
    @value = value
  end

  def self.[](value)
    new(value)
  end

  def left?
    false
  end

  def right?
    true
  end

  def left
    None
  end

  def right
    Some[value]
  end

  def eql?(other)
    other.is_a?(Right) && other.value == value
  end
  alias == eql?

  def hash
    value.hash
  end

  def to_s
    "Right[#{value.inspect}]"
  end
  alias inspect to_s

end
