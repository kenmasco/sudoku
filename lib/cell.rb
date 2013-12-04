class Cell
  
  attr_accessor :value #short for def value=(v); @value=v;
  
  def initialize(value=0)
    @value = value
  end

  def filled_out?
     @value != 0
  end

  def possible_values(neighbours)
    (1..9).to_a - neighbours
  end

  def solve(neighbours)
    values = possible_values(neighbours)
    @value = values.first if values.length == 1
  end
end