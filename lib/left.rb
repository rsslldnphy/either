class Left
  include Either

  def self.[] value
    new value
  end

  def initialize(value)
    @value = value
  end

  def left
    Some[value]
  end

  def right
    None
  end

  def left?
    true
  end

  def right?
    false
  end

  private

  attr_reader :value
end
