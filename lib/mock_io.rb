class MockIO
  attr_reader :inputs

  def initialize(inputs)
    @inputs = inputs ||= "gets was called"
  end
  
  def print(message)
    "print was called"
  end

  def gets
    if inputs.is_a? Array
      @inputs.shift
    else
      inputs
    end
  end
end
