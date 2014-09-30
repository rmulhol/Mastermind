require 'user_interface'
require 'cl_display'
require 'input_output'
require 'game_ai'
require 'game_logic'

describe UserInterface do
  let(:new_game) { described_class.new(io: InputOutput.new, display: CommandLineDisplay.new, ai: GameAI.new, logic: GameLogic.new) }

end
