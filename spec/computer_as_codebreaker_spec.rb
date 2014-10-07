require 'computer_as_codebreaker'
require 'cl_display'
require 'game_ai'
require 'feedback_checker'
require 'input_output'
require 'stringio'
require 'mock_io'


describe ComputerAsCodebreaker do
  let(:new_game) { described_class.new(display: CommandLineDisplay.new, ai: GameAI.new, logic: FeedbackChecker.new, io: InputOutput.new(StringIO.new, StringIO.new)) }

  describe "#introduce_user_to_the_game" do
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
    it "accepts valid feedback" do
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
  end

  describe "#get_white_peg_feedback" do
  end

  describe "#reduce_remaining_combinations" do
  end

  describe "#offer_to_restart_game" do
  end

  describe "#create_all_combinations" do
    let(:all_combinations) { new_game.create_all_combinations }
    
    it "creates 1296 combinations" do
      number_of_combinations = all_combinations.length

      expect(number_of_combinations).to eq(1296)
    end

    it "creates 4 digit combinations" do
      all_combos_4_digits = all_combinations.map { |combo| combo.length == 4 }

      expect(all_combos_4_digits).not_to include(false)
    end

    it "contains no repeats" do
      unique_combos = all_combinations.uniq
      number_of_combos = all_combinations.length
      number_of_unique_combos = unique_combos.length
      
      expect(number_of_unique_combos).to eq(number_of_combos)
    end
  end

  describe "#generate_a_guess" do
    let(:possible_combinations) { [[1,1,1,1], [2,2,2,2], [1,1,2,2]] }
    let(:new_guess) { new_game.generate_a_guess(possible_combinations) }

    it "outputs a 4 element array" do
      expect(new_guess.length).to eq(4)
    end
  end

  describe "#convert_guess_to_colors" do
  end

  describe "#output_first_guess" do
  end

  describe "#output_next_guess" do
  end

  describe "#get_input" do
    it "gets input from the user" do
      allow(new_game).to receive(:get_input) { "input" }
      test_input = new_game.get_input

      expect(test_input).to eq("input")
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

    it "adds 5 turns if run twice" do
      5.times { new_game.increment_turns }

      expect(new_game.turns).to eq(5)
    end
  end
end