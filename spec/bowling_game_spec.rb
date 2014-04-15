require 'bowling_game'

describe BowlingGame, 'score' do

  let(:strike) { [10] }
  let(:normal) { [1,5] }

  context 'simple case, no spares or strikes' do

    it 'is sum of rolls' do
      subject.roll_frame [4,5]
      expect(subject.score).to eq(9)
    end

    it 'is sum of 10 individual rolls' do
      10.times { subject.roll_frame [1,0] }
      expect(subject.score).to eq(10)
    end

  end

  context 'case of a spare' do

    let(:spare) { [5,5] }

    before do
      subject.roll_frame spare
    end

    it 'it doubles the next roll as a bonus' do
      subject.roll_frame [1,0]
      expect(subject.score).to eq((10 + 1) + 1)
    end

    it 'calculates cumulative spares' do
      subject.roll_frame spare
      subject.roll_frame [5,0]
      expect(subject.score).to eq((10 + 5) + (10 + 5) + 5 )
    end
  end

  context 'case of a strike' do
    it 'it doubles the next frames total as bonus ' do
      subject.roll_frame strike
      subject.roll_frame [4,2]
      expect(subject.score).to eq( (10 + 6) + 6 )
    end

  end

  context 'score for multiple frames' do
    it 'calculates score based on frame states' do
      subject.roll_frame normal
      subject.roll_frame strike
      subject.roll_frame normal
      subject.roll_frame strike

      expect(subject.score).to eq(6 + (10 + 6) + 6 + 10 )
    end

  end

  context 'end game' do

    it 'calculates score for no bonus roll' do
      9.times { subject.roll_frame [0,0] }
      subject.roll_frame [4,5]
      expect(subject.score).to eq(9)
    end

    it 'calculates score for a spare' do
      9.times { subject.roll_frame [0,0] }
      subject.roll_frame [5,5,9]
      expect(subject.score).to eq(19)
    end

    it 'calculates score for a strike followed by a spare' do
      9.times { subject.roll_frame [0,0] }
      subject.roll_frame [10,5,5]
      expect(subject.score).to eq(20)
    end

    it 'calculates score a strike, followed by a roll of 10 and 5' do
      9.times { subject.roll_frame [0,0] }
      subject.roll_frame [10,10,5]
      expect(subject.score).to eq(25)
    end

    it 'perfect game score' do
      12.times { subject.roll_frame [10] }
      expect(subject.score).to eq(300)
    end

    # TODO: ideas on approach for the next session
    # -> small steps: get tests green with minimum red time
    # -> calc strike scores based on the next two rolls

  end

end
