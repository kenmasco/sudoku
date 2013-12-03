class Grid
  def initialize(initial_value)
    @cells = initial_value.split
  end

  attr_reader :cells
end

#   def solve
#     outstanding_before, looping = SIZE, false
#     while !solved? && !looping
#       try_to_solve #ask each cell to solve itself
#       outstanding = @cells.count {|c| c.solved?}
#       looping = outstanding_before == outstanding
#       outstanding_before = outstanding
#     end
#   end 

#   def solved?
#     #a grid is solved if all cells are filled out. Use  .all? method
#   end

#   def inspect
#     #iterate over all cells and print the grid
#   end
# end


