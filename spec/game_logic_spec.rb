require 'game_logic'
require 'mock_io'

describe GameLogic do
  let(:new_game) { described_class.new(logic: GameAI.new, display: MockIO.new) }

  describe "#single_peg_feedback_is_valid" do
    it "returns true for an integer between 0 and 4" do
      expect(new_game.single_peg_feedback_is_valid?(1)).to be_truthy
    end

    it "returns false for an irrelevant string" do
      expect(new_game.single_peg_feedback_is_valid?("erroneous string")).to be_falsey
    end

    it "returns true for a stringified integer" do
      expect(new_game.single_peg_feedback_is_valid?("1")).to be_truthy
    end

    it "returns false for an integer that is less than 0" do
      expect(new_game.single_peg_feedback_is_valid?(-1)).to be_falsey
    end

    it "returns false for an integer that is greater than 4" do
      expect(new_game.single_peg_feedback_is_valid?(5)).to be_falsey
    end
  end

  describe "#aggregate_peg_feedback_is_valid" do
    it "returns true if arguments are two valid integers" do
      expect(new_game.aggregate_peg_feedback_is_valid?(1, 1)).to be_truthy
    end

    it "returns true if arguments are two valid stringified integers" do
      expect(new_game.aggregate_peg_feedback_is_valid?("1", "1")).to be_truthy
    end

    it "returns false if arguments erroneous strings" do
      expect(new_game.aggregate_peg_feedback_is_valid?("erroneous", "strings")).to be_falsey
    end

    it "returns false if aggregate pegs are greater than 4" do
      expect(new_game.aggregate_peg_feedback_is_valid?(2, 3)).to be_falsey
    end

    it "returns false if aggregate pegs are less than 0" do
      expect(new_game.aggregate_peg_feedback_is_valid?(0, -1)).to be_falsey
    end
  end
end
