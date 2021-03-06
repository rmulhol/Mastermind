require 'feedback_checker'
require 'mock_io'

describe FeedbackChecker do
  let(:new_game) { described_class.new }

  describe "#single_peg_feedback_is_valid" do
    it "returns true for stringified integer '1'" do
      expect(new_game.single_peg_feedback_is_valid?("1")).to be_truthy
    end

    it "returns false for an irrelevant string" do
      expect(new_game.single_peg_feedback_is_valid?("erroneous string")).to be_falsey
    end

    it "returns true for stringified integer '0'" do
      expect(new_game.single_peg_feedback_is_valid?("0")).to be_truthy
    end

    it "returns false for a stringified integer that is less than 0" do
      expect(new_game.single_peg_feedback_is_valid?("-1")).to be_falsey
    end

    it "returns false for a stringified integer that is greater than 4" do
      expect(new_game.single_peg_feedback_is_valid?("5")).to be_falsey
    end
  end

  describe "#aggregate_peg_feedback_is_valid" do
    it "returns true if arguments are two valid integers" do
      expect(new_game.aggregate_peg_feedback_is_valid?(1, 1)).to be_truthy
    end

    it "returns true if arguments are two valid stringified integers" do
      expect(new_game.aggregate_peg_feedback_is_valid?("1", "1")).to be_truthy
    end

    it "returns false if aggregate pegs are greater than 4" do
      expect(new_game.aggregate_peg_feedback_is_valid?(2, 3)).to be_falsey
    end

    it "returns false if aggregate pegs are less than 0" do
      expect(new_game.aggregate_peg_feedback_is_valid?(0, -1)).to be_falsey
    end

    it "returns false if black pegs are 3 and white pegs are 1" do
      expect(new_game.aggregate_peg_feedback_is_valid?(3, 1)).to be_falsey
    end

    it "returns true if feedback is 0 black pegs and 0 white pegs" do
      expect(new_game.aggregate_peg_feedback_is_valid?(0, 0)).to be_truthy
    end
  end
end
