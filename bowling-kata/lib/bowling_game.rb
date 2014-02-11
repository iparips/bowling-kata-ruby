class BowlingGame
  attr_reader :score

  def initialize
    @score = 0
    @prev_roll = 0
  end

  def roll_frame rolls
    @score += rolls[0] if @prev_roll == 10
    @prev_roll = rolls.inject(&:+)
    @score += @prev_roll
  end

end