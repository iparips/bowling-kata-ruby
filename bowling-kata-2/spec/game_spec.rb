require 'game'

# cmd + opt + F8 -> run current test

describe Game do

  describe 'no bonus throws' do

    it 'is sum of rolls' do
      subject.roll 1,1
      expect(subject.score).to eq(2)
    end

  end


  describe 'spare' do

    it 'is sum of rolls + next roll' do
      subject.roll 3,7,3,3
      expect(subject.score).to eq(13+6)
    end

  end


  describe 'strike' do

  end



end
