require 'stringio'

class MockIO
  attr_reader :reader, :writer

  def initialize(input = '')
    @reader = StringIO.new(input)
    @writer = StringIO.new
  end

  def print(message)
    writer.print(message)
  end

  def string
    writer.string
  end

  def gets
    reader.gets
  end
end
