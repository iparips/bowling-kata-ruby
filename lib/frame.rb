require 'nothing_special'
require 'spare'
require 'strike'
require 'invalid_frame_exception'

class Frame
  attr_reader :rolls

  def initialize(rolls)
    raise InvalidFrameException if is_invalid?(rolls)
    @rolls = rolls
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
    rolls[1]
  end

  # private
  def strike?
    rolls[0] == 10
  end

  def spare?
    rolls.size == 2 && (raw_score == 10)
  end

  private

  def is_invalid?(rolls)
    rolls.empty? || (rolls.size == 1 && rolls.first != 10)
  end


end
