class CommandLineDisplay
  attr_reader :reader, :writer

  def initialize(reader, writer)
    @reader = reader
    @writer = writer
  end

  def output(message)
    writer.print message
    writer.string
  end

  def get_input
    reader.gets.chomp
  end

  def welcome_user
    "Welcome to Mastermind"
  end
end
