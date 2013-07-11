class Right
  include Either

  def self.[] value
    new value
  end

  def initialize(value)
    @value = value
  end

  def left
    None
  end

  def right
    Some[value]
  end

  private

  attr_reader :value
end

