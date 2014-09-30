require_relative 'cl_display'
require_relative 'game_ai'
require_relative 'game_logic'
require_relative 'input_output'
require_relative 'user_interface'

new_game = UserInterface.new(display: CommandLineDisplay.new, ai: GameAI.new, logic: GameLogic.new, io: InputOutput.new(nil, nil))

new_game.play_game
