require 'frame'

describe Frame do

  describe "simple frame" do

    let(:frame) { Frame.new([4, 4]) }

    it "spare is false" do
      expect(frame.spare?).to be_false
    end

    it "strike is false" do
      expect(frame.strike?).to be_false
    end

  end

  describe "#spare?" do
    it "is true when the sum of rolls is 10" do
      frame = Frame.new([4, 6])
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
      frame = Frame.new([1, 0])
      expect(frame.strike?).to eq(false)
    end

  end

  describe "#raw_score" do

    context "when two values are supplied" do

      let(:frame) { Frame.new([1, 2]) }

      it "adds the values" do
        expect(frame.raw_score).to eq(3)
      end
    end
  end

  describe "#first_roll" do

    context "when two values are supplied" do

      let(:frame) { Frame.new([1, 2]) }

      it "returns the first roll value" do
        expect(frame.first_roll).to eq(1)
      end
    end
  end

  describe "#second_roll" do

    context "when two values are supplied" do

      let(:frame) { Frame.new([1, 2]) }

      it "returns the second roll value" do
        expect(frame.second_roll).to eq(2)
      end
    end
  end

  describe "#state" do
    let(:frame) { Frame.new([1, 2]) }

    it "behaves as below" do

      expect_error([], InvalidFrameException)
      expect_error([1], InvalidFrameException)
      expect_frame_yeilds([10], Strike)
      expect_frame_yeilds([1, 2], NothingSpecial)
      expect_frame_yeilds([5, 5], Spare)

    end

    def expect_frame_yeilds(rolls, state_class)
      expect(Frame.new(rolls).state.class).to eq(state_class)
    end

    def expect_error(rolls, error_class)
      expect { Frame.new(rolls) }.to raise_error(error_class)
    end

  end

end
