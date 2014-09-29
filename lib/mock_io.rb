require 'stringio'

class MockIO
  attr_reader :reader, :writer, :print_was_called, :gets_was_called

  def initialize(input = '')
    @reader = StringIO.new(input)
    @writer = StringIO.new
    @print_was_called = false
    @gets_was_called = false
  end

  def print(message)
    writer.print(message)
    print_was_called = true
  end

  def gets
    reader.gets
    gets_was_called = true
  end
end
