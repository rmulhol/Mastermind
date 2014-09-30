class UserInterface
  attr_reader :display, :ai, :logic, :io, :possible_combinations, :guess, :feedback, :turns

  def initialize(**args)
    @display = args.fetch(:display)
    @ai = args.fetch(:ai)
    @logic = args.fetch(:logic)
    @io = args.fetch(:io)
    @possible_combinations = ai.generate_all_combinations
    @guess = ai.generate_a_guess(possible_combinations)
    @feedback = []
    @turns = 0
  end

  def play_game
    start_game
    deliver_first_guess
    until @feedback == [4, 0]
      solicit_feedback
      offer_next_guess
    end
  end

  def start_game
    io.output(display.welcome_user)
    io.output(display.explain_game)
    io.get_input
  end

  def deliver_first_guess
    first_guess = display.convert_numbers_to_colors(guess)
    io.output(display.offer_first_guess(first_guess))
    @turns += 1
  end

  def solicit_feedback
    io.output(display.solicit_feedback_on_black_pegs)
    black_pegs = io.get_input
    until logic.single_peg_feedback_is_valid?(black_pegs)
      io.output(display.error_message)
      black_pegs = io.get_input
    end
    if black_pegs.to_i == 4
      abort("I figured out your code in #{turns} turns!")
    end
    io.output(display.solicit_feedback_on_white_pegs)
    white_pegs = io.get_input
    until logic.single_peg_feedback_is_valid?(white_pegs)
      io.output(display.error_message)
      white_pegs = io.get_input
    end
    until logic.aggregate_peg_feedback_is_valid?(black_pegs, white_pegs)
      io.output(display.error_message_for_invalid_aggregate_feedback)
      solicit_feedback
    end
    @feedback = [black_pegs.to_i, white_pegs.to_i]
  end

  def offer_next_guess
    @possible_combinations = ai.reduce_remaining_combinations(guess, possible_combinations, feedback)
    @guess = ai.generate_a_guess(possible_combinations)
    next_guess = display.convert_numbers_to_colors(@guess)
    io.output(display.offer_next_guess(next_guess))
    @turns += 1
  end
end
