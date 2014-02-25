require 'bowling_game'

describe BowlingGame, 'score' do

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

    let(:strike) { [10] }

    it 'it doubles the next frames total as bonus ' do
      pending
      subject.roll_frame strike
      subject.roll_frame [4,2]
      expect(subject.score).to eq( (10 + 6) + 6 )
    end

  end
end
