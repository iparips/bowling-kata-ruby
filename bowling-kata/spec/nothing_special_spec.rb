require 'nothing_special'
require 'frame'

describe NothingSpecial do
  describe '#score_for' do
    it "should give raw score" do
      frame = Frame.new [5, 0]
      score = subject.score_for(frame)
      expect(score).to eq 5
    end

  end
end