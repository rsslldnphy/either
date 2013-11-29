class Left
  include Either

  def initialize(value)
    @value = value
  end

  def self.[](value)
    new(value)
  end

  def left?
    true
  end

  def right?
    false
  end

  def left
    Some[value]
  end

  def right
    None
  end

  def eql?(other)
    other.is_a?(Left) && other.value == value
  end
  alias == eql?

  def hash
    value.hash
  end

  def to_s
    "Left[#{value.inspect}]"
  end
  alias inspect to_s

end
