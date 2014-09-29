require 'cl_display'
require 'mock_io'

describe CommandLineDisplay do
  let(:new_game) { described_class.new(reader: MockIO.new, writer: MockIO.new) }

  describe "#output" do
    it "calls print with manual string input" do
      test_print_was_called_with_string_input = new_game.output("Hello")

      expect(test_print_was_called_with_string_input).to eq(true)
    end

    it "calls print on strings wrapped in a method" do
      test_print_was_called_with_method_input = new_game.output(new_game.welcome_user)

      expect(test_print_was_called_with_method_input).to eq(true)
    end
  end

  describe "#input" do
    it "gets input from the user" do
      test_gets_was_called = new_game.get_input
      
      expect(test_gets_was_called).to eq(true)
    end
  end
end
