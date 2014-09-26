class CommandLineDisplay
  attr_reader :reader, :writer

  def initialize(**args)
    @reader = args.fetch(:reader, $stdin)
    @writer = args.fetch(:writer, $stdout)
  end

  def output(message)
    writer.print message
    writer.string
  end

  def input
    reader.gets
  end

  def welcome_user
    "Welcome to Mastermind"
  end
end
