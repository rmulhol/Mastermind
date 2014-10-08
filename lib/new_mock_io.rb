require 'pry'
class NewMockIO
  attr_accessor :counter

  def initialize
    @counter = -4
  end
  
  def print(message)
  end

  def gets
    @counter += 1
    @counter.to_s
  end
end
