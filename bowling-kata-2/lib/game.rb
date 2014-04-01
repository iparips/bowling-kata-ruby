class Game

  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(*rolls)
     @rolls += rolls
  end

  def score

    until i > @rolls.length - 1  do

      #if (i < @rolls.length - 1 && spare?(i))
      #  scores << 10 + @rolls[i+2]
      #  i=i+2 # first ball of the next frame
      #end

      i+=1
      scores << @rolls[i]
    end

  if(spare? && can_score_spare?)

    end

    #scores = []
    #i = 0
    #
    #until i > @rolls.length - 1  do
    #
    #  #if (i < @rolls.length - 1 && spare?(i))
    #  #  scores << 10 + @rolls[i+2]
    #  #  i=i+2 # first ball of the next frame
    #  #end
    #
    #  i+=1
    #  scores << @rolls[i]
    #end
    #
    #scores.reduce(:+)
  end

  def can_score_spare?

  def spare?(i)
    (@rolls[i] + @rolls[i+1]) == 10
  end

end
