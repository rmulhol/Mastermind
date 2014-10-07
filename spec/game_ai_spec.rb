require 'game_ai'

describe GameAI do
  let(:new_game) { described_class.new }

  describe "#generate_all_combinations" do
    let(:all_combinations) { new_game.generate_all_combinations }

    it "creates an array" do
      expect(all_combinations.class).to eq(Array)
    end

    it "creates an array of 1296 elements" do
      expect(all_combinations.length).to eq(1296)
    end

    it "creates an array of arrays" do
      all_elements_are_arrays = all_combinations.map { |element| element.is_a? Array }
      
      expect(all_elements_are_arrays).not_to include(false)
    end

    it "creates an array of arrays that are of length 4" do
      all_elements_are_of_length_4 = all_combinations.map { |element| element.length == 4 }

      expect(all_elements_are_of_length_4).not_to include(false)
    end

    it "creates an array of arrays that are each unique" do
      unique_elements = all_combinations.uniq
      number_of_unique_elements = unique_elements.length

      expect(number_of_unique_elements).to eq(1296)
    end
  end

  describe "#generate_guess" do
    let(:possible_combinations) { new_game.generate_all_combinations }
    let(:new_guess) { new_game.generate_guess(possible_combinations) }

    it "outputs an array" do
      expect(new_guess.class).to eq(Array)
    end

    it "outputs an array of length 4" do
      expect(new_guess.length).to eq(4)
    end

    it "outputs an array of 4 numbers" do
      all_guesses_are_numbers = new_guess.map { |element| element.is_a? Fixnum }

      expect(all_guesses_are_numbers).not_to include(false)
    end

    it "outputs an array from the argument that is passed in" do
      expect(possible_combinations.include? new_guess).to eq(true)
    end

    it "outputs a random array from the argument that is passed in" do
      #doesn't truly new_game randomness but gets very close
      guess_one = new_game.generate_guess(possible_combinations)
      guess_two = new_game.generate_guess(possible_combinations)
      guess_three = new_game.generate_guess(possible_combinations)
      
      expect(guess_one == guess_two && guess_two == guess_three).to eq(false)
    end
  end

  describe '#count_black_pegs' do
    it "correctly identifies 0 black pegs when all pegs are different" do
      expect(new_game.count_black_pegs([1, 1, 1, 1], [2, 2, 2, 2])).to eq(0)
    end  

    it "correctly identifies 1 black peg when the first pegs are both 1" do
      expect(new_game.count_black_pegs([1, 1, 1, 1], [1, 2, 2, 2])).to eq(1)
    end
    
    it "correctly identifies 1 black peg when the second pegs are both 1" do
      expect(new_game.count_black_pegs([1, 1, 1, 1], [2, 1, 2, 2])).to eq(1)
    end
    
    it "correctly identifies 2 black pegs when the first and second pegs are both 1" do
      expect(new_game.count_black_pegs([1, 1, 2, 2], [1, 1, 1, 1])).to eq(2)
    end

    it "correctly identifies 4 black pegs when all pegs are 6" do
      expect(new_game.count_black_pegs([6, 6, 6, 6], [6, 6, 6, 6])).to eq(4)
    end
  end

  describe "#count_same_color_pegs" do
    it "correctly identifies 0 same-color pegs when all pegs are different" do
      expect(new_game.count_same_color_pegs([1, 1, 1, 1], [2, 2, 2, 2])).to eq(0)
    end

    it "correctly identifies 1 same-color peg" do
      expect(new_game.count_same_color_pegs([1, 2, 2, 2], [1, 1, 1, 1])).to eq(1)
    end

    it "correctly identifies 1 same-color peg when the first array contains three of an element and the second array contains one" do
      expect(new_game.count_same_color_pegs([1, 1, 1, 3], [1, 2, 2, 2])).to eq(1)
    end
    
    it "correctly identifies 2 same-color pegs" do
      expect(new_game.count_same_color_pegs([3, 3, 1, 1], [3, 3, 3, 3])).to eq(2)
    end

    it "correctly identifies 2 same-color pegs when the first array contains one of an element and the second array contains three" do
      expect(new_game.count_same_color_pegs([1, 1, 1, 2], [1, 2, 2, 2])).to eq(2)
    end

    it "correctly identifies 3 same-color pegs" do
      expect(new_game.count_same_color_pegs([1, 1, 1, 2], [1, 1, 1, 1])).to eq(3)
    end

    it "correctly identifies 3 same-color pegs when the first array contains one of an element and the second array contains two" do
      expect(new_game.count_same_color_pegs([1, 1, 1, 2], [1, 2, 2, 1])).to eq(3)
    end
    
    it "correctly identifies 4 same-color pegs when all pegs are the same" do
      expect(new_game.count_same_color_pegs([1, 1, 1, 1], [1, 1, 1, 1])).to eq(4)
    end
  end

  describe "#count_black_and_white_pegs" do
    it "correctly identifies 0 black pegs and 0 same color pegs" do
      expect(new_game.count_black_and_white_pegs([1, 1, 1, 1], [2, 2, 2, 2])).to eq([0, 0])
    end

    it "correctly identifies 1 black peg and 0 same color pegs" do
      expect(new_game.count_black_and_white_pegs([1, 1, 1, 1], [1, 2, 2, 2])).to eq([1, 0])
    end

    it "correctly identifies 2 black pegs and 0 same color pegs" do
      expect(new_game.count_black_and_white_pegs([1, 1, 1, 1], [1, 1, 2, 2])).to eq([2, 0])
    end

    it "correctly identifies 0 black pegs and 1 same color peg" do
      expect(new_game.count_black_and_white_pegs([2, 2, 1, 2], [1, 3, 3, 3])).to eq([0, 1])
    end

    it "correctly identifies 0 black pegs and 2 same color pegs" do
      expect(new_game.count_black_and_white_pegs([2, 1, 1, 2], [3, 2, 2, 3])).to eq([0, 2])
    end

    it "correctly identifies 1 black peg and 1 white peg" do
      expect(new_game.count_black_and_white_pegs([1, 2, 3, 4], [1, 5, 6, 2])).to eq([1, 1])
    end

    it "correctly identifies 2 black pegs and 2 white pegs" do
      expect(new_game.count_black_and_white_pegs([1, 2, 3, 4], [2, 1, 3, 4])).to eq([2, 2])
    end
  end

  describe "#is_a_possible_combination" do
    it "keeps possible combination with four black pegs and four of the same pegs" do
      expect(new_game.is_a_possible_combination?([1, 1, 1, 1], [1, 1, 1, 1], [4, 0])).to be_truthy
    end

    it "rejects possible combination with four black pegs and four different pegs" do
      expect(new_game.is_a_possible_combination?([1, 1, 1, 1], [2, 2, 2, 2], [4, 0])).to be_falsey
    end

    it "keeps possible combination with three black pegs and three shared pegs" do
      expect(new_game.is_a_possible_combination?([1, 1, 1, 3], [1, 1, 1, 2], [3, 0])).to be_truthy
    end

    it "rejects possible combination with three black pegs but only two shared pegs" do
      expect(new_game.is_a_possible_combination?([1, 1, 1, 3], [1, 1, 2, 2], [3, 0])).to be_falsey
    end
  end

  describe "#reduce_remaining_combinations" do
    it "correctly reduces to one combination with 4 black pegs and four 1 pegs" do
      possible_combinations = new_game.generate_all_combinations
      expect(new_game.reduce_remaining_combinations([1, 1, 1, 1], possible_combinations, [4, 0])).to eq([[1, 1, 1, 1]])
    end

    it "correctly reduces to one combination with 4 black pegs and four 2 pegs" do
      possible_combinations = new_game.generate_all_combinations
      expect(new_game.reduce_remaining_combinations([2, 2, 2, 2], possible_combinations, [4, 0])).to eq([[2, 2, 2, 2]])
    end

    it "correctly reduces to two combinations with 3 black pegs" do
      expect(new_game.reduce_remaining_combinations([1, 1, 1, 1], [[1, 1, 1, 2], [1, 1, 1, 3], [1, 2, 3, 4]], [3, 0])).to eq([[1, 1, 1, 2], [1, 1, 1, 3]])
    end

    it "correctly reduces to one combination with 1 black peg" do
      expect(new_game.reduce_remaining_combinations([1, 1, 1, 1], [[1, 1, 1, 2], [1, 1, 1, 3], [1, 2, 3, 4]], [1, 0])).to eq([[1, 2, 3, 4]])
    end
  end
end
