class MockIO
  def initialize(inputs)
    @inputs = inputs ||= ["gets was called"]
  end
  
  def print(message)
    "print was called"
  end

  def gets
    @inputs.shift
  end
end
