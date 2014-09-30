class InputOutput
  attr_reader :reader, :writer

  def initialize(reader, writer)
    @reader = reader
    @writer = writer
  end

  def reader
    @reader ||= $stdin
  end

  def writer
    @writer ||= $stdout
  end

  def output(message)
    writer.print message
  end

  def get_input
    reader.gets
  end
end
