class ComputerAsCodebreaker
  attr_reader :display, :ai, :logic, :io, :possible_combinations, :guess, :feedback, :turns

  def initialize(**args)
    @display = args.fetch(:display)
    @ai = args.fetch(:ai)
    @logic = args.fetch(:logic)
    @io = args.fetch(:io)
    @turns = 0
  end

  def play_game
    introduce_user_to_the_game
    deliver_first_guess
    solicit_feedback
    until turns >= 10
      deliver_next_guess
      solicit_feedback
    end
    abort(display.announce_loss)
  end

  private

  def introduce_user_to_the_game
    io.output(display.welcome_user)
    io.output(display.explain_game)
    io.get_input
  end

  def deliver_first_guess
    generate_first_guess
    output_first_guess
    increment_turns
  end

  def solicit_feedback
    io.output(display.solicit_feedback_on_black_pegs)
    black_pegs = get_black_peg_feedback
    io.output(display.solicit_feedback_on_white_pegs)
    white_pegs = get_white_peg_feedback
    until logic.aggregate_peg_feedback_is_valid?(black_pegs, white_pegs)
      io.output(display.error_message_for_invalid_aggregate_feedback)
      io.output(display.solicit_feedback_on_black_pegs)
      black_pegs = get_black_peg_feedback
      io.output(display.solicit_feedback_on_white_pegs)
      white_pegs = get_white_peg_feedback
    end
    @feedback = [black_pegs.to_i, white_pegs.to_i]
  end

  def deliver_next_guess
    generate_next_guess
    output_next_guess
    increment_turns
  end

  def generate_first_guess
    @possible_combinations = ai.generate_all_combinations
    @guess = ai.generate_a_guess(possible_combinations)
  end

  def output_first_guess
    first_guess = display.convert_numbers_to_colors(guess)
    io.output(display.offer_first_guess(first_guess))
  end

  def increment_turns
    @turns += 1
  end

  def get_black_peg_feedback
    black_pegs = io.get_input
    until logic.single_peg_feedback_is_valid?(black_pegs)
      io.output(display.error_message)
      black_pegs = io.get_input
    end
    if black_pegs.to_i == 4
      abort(display.announce_win(turns))
    end
    black_pegs.to_i
  end

  def get_white_peg_feedback
    white_pegs = io.get_input
    until logic.single_peg_feedback_is_valid?(white_pegs)
      io.output(display.error_message)
      white_pegs = io.get_input
    end
    white_pegs.to_i
  end

  def generate_next_guess
    @possible_combinations = ai.reduce_remaining_combinations(guess, possible_combinations, feedback)
    if possible_combinations.length != 0
      @guess = ai.generate_a_guess(possible_combinations) 
    else
      offer_to_restart_game
    end
  end

  def output_next_guess
    next_guess = display.convert_numbers_to_colors(@guess)
    io.output(display.offer_next_guess(next_guess))
  end

  def offer_to_restart_game
    io.output(display.no_combinations_error)
    offer_restart = io.get_input
    if offer_restart == "y\n"
      io.output(display.restart_game)
      play_game
    else
      abort(display.goodbye)
    end
  end
end