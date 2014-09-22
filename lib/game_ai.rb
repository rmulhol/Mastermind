class GameAI
  attr_reader :number_of_colors, :number_of_rows

  def initialize
    @number_of_colors = 6
    @number_of_rows = 4
  end

  def generate_all_combinations
    colors_array = (1..number_of_colors).to_a
    possible_combinations = colors_array.repeated_permutation(number_of_rows)
    possible_combinations.to_a
  end

  def generate_a_guess(remaining_combinations)
    amount_of_remaining_combinations = remaining_combinations.length
    remaining_combinations[rand(amount_of_remaining_combinations)]
  end

  def same_color_same_position(first_guess, second_guess)
    black_pegs = 0
    first_guess.each_with_index do |peg, position|
      black_pegs += 1 if peg == second_guess[position]
    end
    black_pegs
  end

  def same_color(first_guess, second_guess)
    same_color = 0
    guess_two = second_guess.clone
    first_guess.each do |peg|
      if guess_two.include? peg
        same_color += 1
        peg_to_remove = guess_two.index(peg)
        guess_two.delete_at(peg_to_remove)
      end
    end
    same_color
  end

  def get_feedback(first_guess, second_guess)
    black_pegs = same_color_same_position(first_guess, second_guess)
    total_same_color = same_color(first_guess, second_guess)
    white_pegs = total_same_color - black_pegs
    result_of_comparison = [black_pegs, white_pegs]
    result_of_comparison
  end

  def is_a_possible_combination?(previous_guess, feedback, remaining_option)
    feedback_on_remaining_option = get_feedback(previous_guess, remaining_option)
    feedback_on_remaining_option == feedback
  end

  def reduce_remaining_combinations(previous_guess, feedback, remaining_combinations)
    new_set_of_combinations = []
    remaining_combinations.each do |possible_combination|
      if is_a_possible_combination?(previous_guess, feedback, possible_combination)
        new_set_of_combinations << possible_combination
      end
    end
    new_set_of_combinations
  end
end
