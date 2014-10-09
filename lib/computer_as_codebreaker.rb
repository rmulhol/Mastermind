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
    @possible_combinations = create_all_combinations
    @guess = generate_guess(possible_combinations)
    first_guess_in_colors = convert_guess_to_colors(guess)
    output_first_guess(first_guess_in_colors)
    @turns = set_to_one
  end

  def deliver_next_guess
    @possible_combinations = reduce_remaining_combinations
    check_if_no_combinations(possible_combinations)
    @guess = generate_guess(possible_combinations)
    next_guess_in_colors = convert_guess_to_colors(guess)
    output_next_guess(next_guess_in_colors)
    @turns = add_one(turns)
  end
  
  def solicit_feedback
    query_feedback_on_black_pegs
    black_pegs = get_black_peg_feedback
    query_feedback_on_white_pegs
    white_pegs = get_white_peg_feedback
    confirm_feedback_is_valid(black_pegs, white_pegs)
  end
 
  def confirm_feedback_is_valid(black_pegs, white_pegs) 
    if logic.aggregate_peg_feedback_is_valid?(black_pegs, white_pegs)
      @feedback = [black_pegs.to_i, white_pegs.to_i]
    else
      deliver_error_message_for_invalid_aggregate_feedback
      solicit_feedback
    end
  end

  def get_black_peg_feedback
    black_pegs = get_input
    until logic.single_peg_feedback_is_valid?(black_pegs)
      deliver_error_message_for_invalid_input
      black_pegs = get_input
    end
    end_game_if_4_black_pegs(black_pegs)
    black_pegs.to_i
  end

  def get_white_peg_feedback
    white_pegs = get_input
    until logic.single_peg_feedback_is_valid?(white_pegs)
      deliver_error_message_for_invalid_input
      white_pegs = get_input
    end
    white_pegs.to_i
  end

  def end_game_if_4_black_pegs(black_pegs)
    if black_pegs.to_i == 4
      abort(messages.announce_win(turns))
    end
  end
  
  def reduce_remaining_combinations
    ai.reduce_remaining_combinations(guess, possible_combinations, feedback)
  end

  def check_if_no_combinations(remaining_combinations)
    if remaining_combinations.length == 0
      address_no_remaining_combinations
    end
  end
 
  def address_no_remaining_combinations
    announce_no_more_combinations 
    offer_restart = get_input
    if offer_restart == "y\n"
      announce_game_restart
      play_game
    else
      abort(messages.say_goodbye)
    end
  end

  def create_all_combinations
    ai.generate_all_combinations
  end

  def generate_guess(remaining_combinations)
    ai.generate_guess(remaining_combinations)
  end

  def convert_guess_to_colors(guess)
    messages.convert_numbers_to_colors(guess)
  end

  def set_to_one
    1
  end

  def add_one(turns)
    turns += 1
  end
  
  def get_input
    io.get_input
  end
  
  def welcome_user
    io.output(messages.welcome_user)
  end

  def explain_game
    io.output(messages.explain_game)
  end
  
  def output_first_guess(first_guess)
    io.output(messages.offer_first_guess(first_guess))
  end

  def output_next_guess(next_guess)
    io.output(messages.offer_next_guess(next_guess))
  end
  
  def query_feedback_on_black_pegs
    io.output(messages.solicit_feedback_on_black_pegs)
  end

  def query_feedback_on_white_pegs
    io.output(messages.solicit_feedback_on_white_pegs)
  end

  def announce_no_more_combinations
    io.output(messages.deliver_error_message_for_no_remaining_combinations)
  end

  def announce_game_restart
    io.output(messages.offer_to_restart_game)
  end

  def deliver_error_message_for_invalid_input
    io.output(messages.deliver_error_message_for_invalid_input)
  end

  def deliver_error_message_for_invalid_aggregate_feedback
    io.output(messages.deliver_error_message_for_invalid_aggregate_feedback)
  end
end
