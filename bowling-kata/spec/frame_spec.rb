require 'frame'
describe Frame do

  describe "spare?" do
    it "is true when the sum of rolls is 10" do
      frame = Frame.new([4,6])
      expect(frame.spare?).to be_true
    end

    it "is false when a strike is rolled" do
      frame = Frame.new([10])
      expect(frame.spare?).to be_false
    end

  end


  describe "#strike?" do
    it "is true when the first roll is 10" do
      frame = Frame.new([10])
      expect(frame.strike?).to eq(true)
    end
    it "is false when the first roll is not 10" do
      frame = Frame.new([1,0])
      expect(frame.strike?).to eq(false)
    end
  end
end
