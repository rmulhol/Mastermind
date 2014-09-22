require 'game_ai'

describe GameAI do
  let(:new_game) { described_class.new }

  describe "#generate_all_possible_combinations" do
    let(:all_combinations) { new_game.generate_all_possible_combinations }

    it "creates an array" do
      expect(all_combinations.class).to eq(Array)
    end

    it "creates an array of 1296 elements" do
      expect(all_combinations.length).to eq(1296)
    end

    it "creates an array of arrays" do
      expect(all_combinations.map { |element| element.is_a? Array }).not_to include(false)
    end

    it "creates an array of arrays that are of length 4" do
      expect(all_combinations.map { |element| element.length == 4 }).not_to include(false)
    end

    it "creates an array of arrays that are each unique" do
      expect(all_combinations.uniq.length).to eq(1296)
    end
  end
end
