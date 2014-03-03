require 'frame'

class BowlingGame
  attr_reader :score

  def initialize
    @score = 0
    @prev_frame = Frame.new([0,0])
  end

  def roll_frame rolls

    frame = Frame.new(rolls)

    if @prev_frame.strike?
      @score += frame.raw_score * 2
    elsif @prev_frame.spare?
      @score += frame.first_roll * 2 + frame.second_roll
    else
      @score += frame.raw_score
    end

    @prev_frame = frame

  end

end
