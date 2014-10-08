require 'computer_as_codebreaker'
require 'mock_cli'
require 'mock_game_ai'
require 'feedback_checker'
require 'input_output'
require 'stringio'
require 'mock_io'

describe ComputerAsCodebreaker do
  let(:new_game) { described_class.new(messages: MockCLI.new, ai: MockGameAI.new, logic: FeedbackChecker.new, io: InputOutput.new(MockIO.new, MockIO.new)) }

  describe "#introduce_user_to_the_game" do
    it "continues after receiving input" do
      get_input_call = new_game.introduce_user_to_the_game
      get_input_was_called = "gets was called"
      
      expect(get_input_call).to eq(get_input_was_called)
    end
  end
  
  describe "#deliver_first_guess" do
  end

  describe "#solicit_feedback" do
  end

  describe "#deliver_next_guess" do
  end

  describe "#get_black_peg_feedback" do
  end

  describe "#get_white_peg_feedback" do
  end

  describe "#reduce_remaining_combinations" do
    it "calls reduce_remaining_combinations from GameAI" do
      reduce_combinations_call = new_game.reduce_remaining_combinations
      reduce_combinations_was_called = "reduce remaining combinations was called"

      expect(reduce_combinations_call).to eq(reduce_combinations_was_called)
    end
  end

  describe "#check_if_no_combinations" do
    it "offers to restart game if no more combinations" do
      remaining_combinations = []
      allow(new_game).to receive(:address_no_remaining_combinations) { "called" }
      test_check = new_game.check_if_no_combinations(remaining_combinations)

      expect(test_check).to eq("called")
    end

    it "does nothing if combinations remain" do
      remaining_combinations = [1]
      check_if_no_combinations_call = new_game.check_if_no_combinations(remaining_combinations)
      
      expect(check_if_no_combinations_call).to eq(nil)
    end
  end

  describe "#address_no_remaining_combinations" do
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
    it "calls #convert_numbers_to_colors from messages" do
      guess = []
      convert_guess_to_colors_call = new_game.convert_guess_to_colors(guess)
      convert_guess_was_called = "convert numbers to colors was called"

      expect(convert_guess_to_colors_call).to eq(convert_guess_was_called)
    end
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
  
  describe "#announce_no_more_combinations" do
    it "calls print from io" do
      announce_no_more_combos_call = new_game.announce_no_more_combinations
      output_was_called = "print was called"

      expect(announce_no_more_combos_call).to eq(output_was_called)
    end
  end

  describe "#announce_game_restart" do
    it "calls print from io" do
      announce_game_restart_call = new_game.announce_game_restart
      output_was_called = "print was called"

      expect(announce_game_restart_call).to eq(output_was_called)
    end
  end

  describe "#deliver_error_message_for_invalid_input" do
    it "calls print from io" do
      deliver_error_message_call = new_game.deliver_error_message_for_invalid_input
      output_was_called = "print was called"

      expect(deliver_error_message_call).to eq(output_was_called)
    end
  end

  describe "#get_input" do
    it "gets input from the user" do
      get_input_call = new_game.get_input
      gets_was_called = "gets was called"

      expect(get_input_call).to eq(gets_was_called)
    end
  end

  describe "#set_to_one" do
    it "sets number of turns to one at beginning of game" do
      turns = new_game.set_to_one

      expect(turns).to eq(1)
    end
  end

  describe "#add_one" do
    it "adds 1 turn if run once" do
      turns = 0

      expect(new_game.add_one(turns)).to eq(1)
    end

    it "adds 5 turns if run five times" do
      turns = 0
      turns = 5.times { new_game.add_one(turns) }

      expect(turns).to eq(5)
    end
  end
end
