require 'computer_as_codebreaker'
require 'cl_display'
require 'mock_game_ai'
require 'feedback_checker'
require 'input_output'
require 'stringio'
require 'mock_io'

describe ComputerAsCodebreaker do
  let(:new_game) { described_class.new(display: CommandLineDisplay.new, ai: MockGameAI.new, logic: FeedbackChecker.new, io: InputOutput.new(MockIO.new, MockIO.new)) }

  describe "#introduce_user_to_the_game" do
    # integration tests? test output to stdout?
    it "continues after receiving input" do
      allow(new_game).to receive(:get_input) { "input" } 
      test_intro = new_game.introduce_user_to_the_game
      
      expect(test_intro).to eq("input")
    end
  end
  
  describe "#deliver_first_guess" do
    # integration tests?
  end

  describe "#solicit_feedback" do
    it "accepts valid feedback of 0 and 0" do
      allow(new_game).to receive(:get_black_peg_feedback) { 0 }
      allow(new_game).to receive(:get_white_peg_feedback) { 0 }
      test_feedback = new_game.solicit_feedback

      expect(test_feedback).to eq([0, 0])
    end
    
    it "accepts valid feedback of 1 and 2" do
      allow(new_game).to receive(:get_black_peg_feedback) { 1 }
      allow(new_game).to receive(:get_white_peg_feedback) { 2 }
      test_feedback = new_game.solicit_feedback

      expect(test_feedback).to eq([1, 2])
    end
  end

  describe "#deliver_next_guess" do
    # integration tests?
  end

  describe "#get_black_peg_feedback" do
    it "accepts valid integers" do
      allow(new_game).to receive(:get_input) { 1 }
      test_black_peg_feedback = new_game.get_black_peg_feedback

      expect(test_black_peg_feedback).to eq(1)
    end

    it "accepts valid strings" do
      allow(new_game).to receive(:get_input) { "1" }
      test_accepts_strings = new_game.get_black_peg_feedback

      expect(test_accepts_strings).to eq(1)
    end
  end

  describe "#get_white_peg_feedback" do
    it "accepts valid integers" do
      allow(new_game).to receive(:get_input) { 1 } 
      test_white_peg_feedback = new_game.get_white_peg_feedback

      expect(test_white_peg_feedback).to eq(1)
    end

    it "accepts valid strings" do
      allow(new_game).to receive(:get_input) { "1" }
      test_accepts_strings = new_game.get_white_peg_feedback

      expect(test_accepts_strings).to eq(1)
    end
  end

  describe "#reduce_remaining_combinations" do
    it "calls reduce_remaining_combinations from GameAI" do
      reduce_combinations_call = new_game.reduce_remaining_combinations
      reduce_combinations_was_called = "reduce remaining combinations was called"

      expect(reduce_combinations_call).to eq(reduce_combinations_was_called)
    end
  end

  describe "#check_if_no_more_combinations" do
  end

  describe "#offer_to_restart_game" do
  end

  describe "#welcome_user" do
    it "calls output from io" do
      welcome_user_call = new_game.welcome_user
      output_was_called = "print was called"
      
      expect(welcome_user_call).to eq(output_was_called)
    end
  end

  describe "#explain_game" do
    it "calls output from io" do
      explain_game_call = new_game.explain_game
      output_was_called = "print was called"

      expect(explain_game_call).to eq(output_was_called)
    end
  end

  describe "#create_all_combinations" do
    it "calls generate all combinations from GameAI" do
      generate_combinations_call = new_game.create_all_combinations
      generate_combinations_was_called = "generate all combinations was called"

      expect(generate_combinations_call).to eq(generate_combinations_was_called)
    end 
  end

  describe "#generate_guess" do
    it "calls generate_guess from GameAI" do
      possible_combinations = []
      generate_guess_call = new_game.generate_guess(possible_combinations)
      generate_guess_was_called = "generate a guess was called"
      
      expect(generate_guess_call).to eq(generate_guess_was_called)
    end
  end

  describe "#convert_guess_to_colors" do
  end

  describe "#output_first_guess" do
    it "calls print from io" do
      guess = []
      output_first_guess_call = new_game.output_first_guess(guess)
      output_was_called = "print was called"

      expect(output_first_guess_call).to eq(output_was_called)
    end
  end

  describe "#output_next_guess" do
    it "calls print from io" do
      guess = []
      output_next_guess_call = new_game.output_next_guess(guess)
      output_was_called = "print was called"

      expect(output_next_guess_call).to eq(output_was_called)
    end
  end

  describe "#get_input" do
    it "gets input from the user" do
      get_input_call = new_game.get_input
      gets_was_called = "gets was called"

      expect(get_input_call).to eq(gets_was_called)
    end
  end

  describe "#set_turns_to_zero" do
    it "sets number of turns to zero at beginning of game" do
      new_game.set_turns_to_zero

      expect(new_game.turns).to eq(0)
    end
  end

  describe "#increment turns" do
    it "adds 1 turn if run once" do
      expect(new_game.increment_turns).to eq(1)
    end

    it "adds 5 turns if run five times" do
      5.times { new_game.increment_turns }

      expect(new_game.turns).to eq(5)
    end
  end
end
