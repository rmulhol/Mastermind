class MockCLI
  def welcome_user
    "welcome user was called"
  end

  def explain_game
    "explain game was called"
  end

  def offer_first_guess(guess)
    "offer first guess was called"
  end

  def offer_next_guess(guess)
    "offer next guess was called"
  end

  def offer_to_restart_game
    "offer to restart game was called"
  end
  
  def convert_numbers_to_colors(number)
    "convert numbers to colors was called"
  end

  def solicit_feedback_on_black_pegs
    "black peg feedback called"
  end

  def solicit_feedback_on_white_pegs
    "white peg feedback called"
  end

  def deliver_error_message_for_no_remaining_combinations
    "deliver no combos error was called"
  end

  def deliver_error_message_for_invalid_input
    "deliver invalid input error was called"
  end

  def deliver_error_message_for_invalid_aggregate_feedback
    "deliver invalid aggregate input error was called"
  end

  def say_goodbye
    "say goodbye was called"
  end

  def announce_win(turns)
    "announce win was called"
  end
end
