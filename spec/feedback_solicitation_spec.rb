require 'computer_as_codebreaker'
require 'input_output'
require 'mock_game_ai'
require 'mock_cli'
require 'feedback_checker'
require 'new_mock_io'

describe ComputerAsCodebreaker do

  describe "#get_black_peg_feedback" do
    let(:new_game) { described_class.new(messages: MockCLI.new, ai: MockGameAI.new, logic: FeedbackChecker.new, io: InputOutput.new(NewMockIO.new, NewMockIO.new)) }
    
    it "only accepts valid feedback" do
      # cycles through -3, -2, -1 before it accepts 0
      only_valid_feedback = new_game.get_black_peg_feedback
      expect(only_valid_feedback).to eq(0)
    end
  end

  describe "#get_white_peg_feedback" do
    let(:new_game) { described_class.new(messages: MockCLI.new, ai: MockGameAI.new, logic: FeedbackChecker.new, io: InputOutput.new(NewMockIO.new, NewMockIO.new)) }
    
    it "only accepts valid feedback" do
      # cycles through -3, -2, -1 before it accepts 0
      only_valid_feedback = new_game.get_white_peg_feedback
      expect(only_valid_feedback).to eq(0)
    end
  end
end
