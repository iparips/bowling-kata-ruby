class BowlingGame
  attr_reader :score

  def initialize
    @score = 0
    @prev_roll = 0
    @prev_roll_strike = false
  end

  def roll_frame rolls

    #if prev strike then score += (sum of rolls) * 2
    #if prev spare then score += first frame score * 2

    @score += rolls[0] if @prev_roll == 10
    @prev_roll = rolls.inject(&:+)
    @prev_roll_strike = true if rolls[0] == 10

    if @prev_roll_strike
      @score += (@prev_roll + 6) +6
    else
      @score += @prev_roll
    end

  end

end