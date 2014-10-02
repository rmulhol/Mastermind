require_relative 'cl_display'
require_relative 'game_ai'
require_relative 'feedback_checker'
require_relative 'input_output'
require_relative 'computer_as_codebreaker'

new_game = ComputerAsCodebreaker.new(display: CommandLineDisplay.new, ai: GameAI.new, logic: FeedbackChecker.new, io: InputOutput.new(nil, nil))

new_game.play_game
