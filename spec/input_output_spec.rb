require 'input_output'
require 'mock_io'

describe InputOutput do
  let(:new_game) { described_class.new(MockIO.new(nil), MockIO.new(nil)) }

  describe "#output" do
    it "calls print" do
      test_print_was_called_with_string_input = new_game.output("Hello")

      expect(test_print_was_called_with_string_input).to eq("print was called")
    end
  end

  describe "#input" do
    it "gets input from the user" do
      test_gets_was_called = new_game.get_input
      
      expect(test_gets_was_called).to eq("gets was called")
    end
  end
end
