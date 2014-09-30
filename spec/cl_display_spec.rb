require 'cl_display'

describe CommandLineDisplay do
  let(:new_display) { described_class.new }

  describe "#convert_numbers_to_colors" do
    it "converts an array of [1, 1, 1, 1] to [\"red\", \"red\", \"red\", \"red\"]" do
      expect(new_display.convert_numbers_to_colors([1, 1, 1, 1])).to eq(["red", "red", "red", "red"])
    end

    it "converts an array of [2, 2, 2, 2] to [\"blue\", \"blue\", \"blue\", \"blue\"]" do
      expect(new_display.convert_numbers_to_colors([2, 2, 2, 2])).to eq(["blue", "blue", "blue", "blue"])
    end

    it "converts an array of [1, 2, 3, 4] to [\"red\", \"blue\", \"green\", \"yellow\"]" do
      expect(new_display.convert_numbers_to_colors([1, 2, 3, 4])).to eq(["red", "blue", "green", "yellow"])
    end
  end
end
