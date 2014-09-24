require 'cl_display'
require 'mock_io'

describe CommandLineDisplay do
  let(:new_game) { described_class.new(MockIO.new("Test reader"), MockIO.new) }

  describe "#output" do
    it "says hello" do
      expect(new_game.output("Hello")).to eq("Hello")
    end

    it "says goodbye" do
      expect(new_game.output("Goodbye")).to eq("Goodbye")
    end

    it "welcomes user when given proper input" do
      expect(new_game.output(new_game.welcome_user)).to eq("Welcome to Mastermind")
    end
  end

  describe "#get_input" do
    it "gets input from the user" do
      expect(new_game.get_input).to eq("Test reader")
    end
  end
end
