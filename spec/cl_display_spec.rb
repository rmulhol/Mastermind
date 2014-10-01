require 'cl_display'

describe CommandLineDisplay do
  let(:new_display) { described_class.new }

  describe "#convert_numbers_to_colors" do
    it "converts an array of [1, 1, 1, 1] to [\"red\", \"red\", \"red\", \"red\"]" do
      expect(new_display.convert_numbers_to_colors([1, 1, 1, 1])).to eq(["red", "red", "red", "red"])
    end

    it "converts an array of [2, 2, 2, 2] to [\"blue\", \"blue\", \"blue\", \"blue\"]" do
      expect(new_display.convert_numbers_to_colors([2, 2, 2, 2])).to eq(["blue", "blue", "blue", "blue"])
    end

    it "converts an array of [1, 2, 3, 4] to [\"red\", \"blue\", \"green\", \"yellow\"]" do
      expect(new_display.convert_numbers_to_colors([1, 2, 3, 4])).to eq(["red", "blue", "green", "yellow"])
    end
  end

  describe "#welcome_user" do
    it "welcomes the user" do
      expect(new_display.welcome_user).to include("welcome")
    end
  end

  describe "#explain_game" do
    it "explains how to play" do
      expect(new_display.explain_game).to include("secret code")
    end
  end

  describe "#offer_first_guess" do
    it "offers the first guess" do
      test_guess = ["red", "red", "red", "red"]
      
      expect(new_display.offer_first_guess(test_guess)).to include("first", "red")
    end
  end

  describe "#solicit_feedback_on_black_pegs" do
    it "asks how many black pegs have been earned" do
      expect(new_display.solicit_feedback_on_black_pegs).to include("correct position")
    end
  end

  describe "#solicit_feedback_on_white_pegs" do
    it "asks how many white pegs have been earned" do
      expect(new_display.solicit_feedback_on_white_pegs).to include("incorrect position")
    end
  end

  describe "#offer_next_guess" do
    it "offers a guess that is not the first" do
      test_guess = ["blue", "blue", "blue", "blue"]

      expect(new_display.offer_next_guess(test_guess)).to include("next", "blue")
    end
  end

  describe "#error_message" do
    it "indicates input is invalid" do
      expect(new_display.error_message).to include("Invalid")
    end
  end

  describe "#error_message_for_invalid_aggregate_feedback" do
    it "indicates that aggregate feedback on black and white pegs is invalid" do
      expect(new_display.error_message_for_invalid_aggregate_feedback).to include("isn't possible")
    end
  end

  describe "#no_combinations_error" do
    it "indicates there are no more remaining possible combinations" do
      expect(new_display.no_combinations_error).to include("no remaining")
    end
  end

  describe "#restart_game" do
    it "announces the game is restarting" do
      expect(new_display.restart_game).to include("restarting")
    end
  end

  describe "#goodbye" do
    it "acknowledges user is exiting the game" do
      expect(new_display.goodbye).to include("play again soon")
    end
  end

  describe "#announce_win" do
    it "announces the computer has won in a given number of turns" do
      test_turns = 5

      expect(new_display.announce_win(test_turns)).to include("figured out", "5")
    end
  end

  describe "#announce_loss" do
    it "announce the computer hasn't won within 10 turns" do
      expect(new_display.announce_loss).to include("couldn't figure out")
    end
  end
end
