require 'frame'
require 'nothing_special'

class BowlingGame
  attr_reader :score

  def initialize
    @score = 0
    @prev_state = NothingSpecial.new
  end

  def roll_frame rolls
    frame = Frame.new(rolls)
    @score += frame.score_based_on(@prev_state)
    @prev_state = frame.state
  end

end
