require 'nothing_special'
require 'spare'
require 'strike'

class Frame
  attr_reader :rolls

  def initialize rolls
    @rolls = rolls
  end

  def strike?
    rolls[0] == 10
  end

  def spare?
    rolls.size == 2 && (raw_score == 10)
  end

  def score_based_on(previous_state)
    previous_state.score_for(self)
  end

  def state
    return Spare.new if self.spare?
    return Strike.new if self.strike?
    return NothingSpecial.new
  end

  def raw_score
    rolls.reduce(:+)
  end

  def first_roll
    rolls.first
  end

  def second_roll
    rolls.last
  end

end
