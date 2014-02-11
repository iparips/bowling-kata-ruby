require 'bowling_game'

describe BowlingGame do

  context 'simple case, no spares or strikes' do

    it 'is sum of rolls' do
      subject.roll_frame [4,5]
      expect(subject.score).to eq(9)
    end

    it 'is the total of 10 frames scores' do
      10.times { subject.roll_frame [1,0] }
      expect(subject.score).to eq(10)
    end

  end

  context 'case of a spare' do

    it 'it adds the next roll score to the total score twice' do
      subject.roll_frame [5,5]
      subject.roll_frame [1,1]
      expect(subject.score).to eq(13)
    end

    it 'is the total of 2 frames with two spares' do
      subject.roll_frame [5,5]
      subject.roll_frame [5,5]
      subject.roll_frame [5,0]
      expect(subject.score).to eq(35)
    end

    it 'is the total of 10 frames score' do
      10.times { subject.roll_frame [5,5] }
      subject.roll_frame [5,0]
      expect(subject.score).to eq(150)
    end

  end
end