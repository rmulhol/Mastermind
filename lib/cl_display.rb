class CommandLineDisplay
  def convert_numbers_to_colors(array_of_numbers)
    possible_colors = { 1 => "red", 2 => "blue", 3 => "green", 4 => "yellow", 5 => "purple", 6 => "orange" }
    array_of_colors = array_of_numbers.map do |number|
      possible_colors.fetch(number)
    end
    array_of_colors
  end

  def welcome_user
    "Hello, welcome to Mastermind.\n"
  end

  def explain_game
    "In this game, you'll think up a secret code and I'll try to figure it out.\n"\
"Your code should be 4 elements long, with each element drawn from the following six colors:\n"\
"red, blue, green, yellow, purple, orange. Repeats are allowed. After each guess, I'll ask for feedback.\n"\
"You'll need to tell me how many of my picks are the correct color and in the correct position, as well as\n"\
"how many are the correct color but in the incorrect position. Hit enter when you're ready to play!\n"
  end

  def offer_first_guess(guess)
    "My first guess is #{guess}\n"
  end

  def solicit_feedback_on_black_pegs
    "How many of my picks are the correct color *and* in the correct position?\n"
  end

  def solicit_feedback_on_white_pegs
    "How many of my picks are the correct color by in the incorrect position?\n"
  end

  def offer_next_guess(guess)
    "My next guess is #{guess}\n"
  end

  def error_message
    "Invalid input. Please try again.\n"
  end

  def error_message_for_invalid_aggregate_feedback
    "That feedback isn't possible. Try again.\n"
  end
end
