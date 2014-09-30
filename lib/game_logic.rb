class GameLogic
  def single_peg_feedback_is_valid?(single_peg)
    if single_peg.to_i == 0
      single_peg.strip == "0"
    else
      single_peg.to_i >= 0 && single_peg.to_i <= 4
    end
  end

  def aggregate_peg_feedback_is_valid?(black_pegs, white_pegs)
    aggregate_feedback = black_pegs.to_i + white_pegs.to_i 
    if black_pegs.to_i == 3 && white_pegs.to_i == 1
      false
    else
      aggregate_feedback <= 4 && aggregate_feedback >= 0
    end
  end
end
