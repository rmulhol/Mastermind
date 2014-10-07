require 'stringio'

class MockIO
  attr_reader :reader, :writer, :print_was_called, :gets_was_called

  def initialize(input = '')
    @reader = StringIO.new(input)
    @writer = StringIO.new
  end

  def print(message)
    writer.print(message)
    "print was called"
  end

  def gets
    reader.gets
    "gets was called"
  end
end
