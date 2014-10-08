class ComputerAsCodebreaker
  attr_reader :messages, :ai, :logic, :io, :possible_combinations, :guess, :feedback, :turns

  def initialize(**args)
    @messages = args.fetch(:messages)
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
    abort(messages.announce_loss)
  end

  def introduce_user_to_the_game
    welcome_user
    explain_game
    get_input
  end

  def deliver_first_guess
    create_all_combinations
    first_guess = generate_guess(possible_combinations)
    first_guess_in_colors = convert_guess_to_colors(first_guess)
    output_first_guess(first_guess_in_colors)
    increment_turns
  end

  def solicit_feedback
    io.output(messages.solicit_feedback_on_black_pegs)
    black_pegs = get_black_peg_feedback
    io.output(messages.solicit_feedback_on_white_pegs)
    white_pegs = get_white_peg_feedback
    until logic.aggregate_peg_feedback_is_valid?(black_pegs, white_pegs)
      io.output(messages.deliver_error_message_for_invalid_aggregate_feedback)
      io.output(messages.solicit_feedback_on_black_pegs)
      black_pegs = get_black_peg_feedback
      io.output(messages.solicit_feedback_on_white_pegs)
      white_pegs = get_white_peg_feedback
    end
    @feedback = [black_pegs.to_i, white_pegs.to_i]
  end

  def deliver_next_guess
    reduce_remaining_combinations
    check_if_no_more_combinations
    next_guess = generate_guess(possible_combinations)
    next_guess_in_colors = convert_guess_to_colors(next_guess)
    output_next_guess(next_guess_in_colors)
    increment_turns
  end
  
  def get_black_peg_feedback
    black_pegs = get_input
    until logic.single_peg_feedback_is_valid?(black_pegs)
      io.output(messages.deliver_error_message_for_invalid_input)
      black_pegs = get_input
    end
    if black_pegs.to_i == 4
      abort(messages.announce_win(turns))
    end
    black_pegs.to_i
  end

  def get_white_peg_feedback
    white_pegs = get_input
    until logic.single_peg_feedback_is_valid?(white_pegs)
      io.output(messages.deliver_error_message_for_invalid_input)
      white_pegs = get_input
    end
    white_pegs.to_i
  end

  def reduce_remaining_combinations
    @possible_combinations = ai.reduce_remaining_combinations(guess, possible_combinations, feedback)
  end

  def check_if_no_more_combinations
    if possible_combinations.length == 0
      offer_to_restart_game
    end
  end
 
  def offer_to_restart_game
    announce_no_more_combinations 
    offer_restart = get_input
    if offer_restart == "y\n"
      io.output(messages.offer_to_restart_game)
      set_turns_to_zero
      play_game
    else
      abort(messages.say_goodbye)
    end
  end

  def welcome_user
    io.output(messages.welcome_user)
  end

  def explain_game
    io.output(messages.explain_game)
  end

  def create_all_combinations
    @possible_combinations = ai.generate_all_combinations
  end

  def generate_guess(remaining_combinations)
    @guess = ai.generate_guess(remaining_combinations)
  end

  def convert_guess_to_colors(guess)
    messages.convert_numbers_to_colors(guess)
  end

  def output_first_guess(first_guess)
    io.output(messages.offer_first_guess(first_guess))
  end

  def output_next_guess(next_guess)
    io.output(messages.offer_next_guess(next_guess))
  end
  
  def announce_no_more_combinations
    io.output(messages.deliver_error_message_for_no_remaining_combinations)
  end

  def get_input
    io.get_input
  end

  def set_turns_to_zero
    @turns = 0
  end

  def increment_turns
    @turns += 1
  end
end
