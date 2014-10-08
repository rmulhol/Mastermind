require 'stringio'

class MockIO
  def print(message)
    "print was called"
  end

  def gets
    "gets was called"
  end
end
