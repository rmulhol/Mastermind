class GameLogic
  attr_reader :logic, :display

  def initialize(**args)
    @logic = args.fetch(:logic)
    @display = args.fetch(:display)
  end

  def welcome_user
    display.output(display.welcome_user)
  end
  
  def single_peg_feedback_is_valid?(single_peg)
    if single_peg.to_i == 0
      single_peg.strip == "0"
    else
      single_peg.to_i >= 0 && single_peg.to_i <= 4
    end
  end

  def aggregate_peg_feedback_is_valid?(black_pegs, white_pegs)
    aggregate_feedback = black_pegs.to_i + white_pegs.to_i 
    if aggregate_feedback == 0
      (black_pegs + white_pegs).strip == "0"
    else
      aggregate_feedback <= 4 && aggregate_feedback >= 0
    end
  end
end
