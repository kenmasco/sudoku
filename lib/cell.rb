class Cell
  
  attr_accessor :value #short for def value=(v); @value=v;
  
  def initialize
    # @value = nil
  end

  def empty?
    @value.nil?
  end

  def possible_values(neighbours)
    (1..9).to_a - neighbours
  end

  def solve(neighbours)
    values = possible_values(neighbours)
    if values.length == 1
      self.value = values.first
    end
  end

end