class Spare

  def score_for(frame)
    frame.first_roll * 2 + frame.second_roll
  end

end