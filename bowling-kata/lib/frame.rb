class Frame
  attr_reader :rolls
  def initialize rolls
    @rolls = rolls
  end

  def strike?
    rolls[0] == 10
  end

  def spare?
    not strike?
  end

end
