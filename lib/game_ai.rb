class GameAI
  attr_reader :number_of_colors, :number_of_rows

  def initialize
    @number_of_colors = 6
    @number_of_rows = 4
  end

  def generate_all_possible_combinations
    colors_array = (1..number_of_colors).to_a
    possible_combinations = colors_array.repeated_permutation(number_of_rows)
    possible_combinations.to_a
  end
end
