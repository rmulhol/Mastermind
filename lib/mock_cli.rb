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
  
  def convert_numbers_to_colors(number)
    "convert numbers to colors was called"
  end

  def deliver_error_message_for_no_remaining_combinations
    "deliver no combos error was called"
  end
end
