require_relative 'spec_helper'

describe CommandLineDisplay do
  let(:new_game) { described_class.new(reader: MockIO.new("hello"), writer: MockIO.new) }

  describe "#output" do
    it "calls print with manual string input" do
      expect(new_game.output("Hello")).to eq("Hello")
    end

    it "calls print on strings wrapped in a method" do
      expect(new_game.output(new_game.welcome_user)).to eq("Welcome to Mastermind")
    end
  end

  describe "#input" do
    it "gets input from the user" do
      expect(new_game.input).to eq("hello")
    end
  end
end
