class Grid
  attr_accessor :cells

  def initialize(initial_values)
    @cells = initial_values.split('').map {|i| Cell.new(i.to_i)}
  end

  def row
    rows = []
    cells.each_slice(9) { |row| rows << row }
    rows
  end

  def column
    row.transpose
  end

  def which_row(cell_number)
    cell_number / 9
  end

  def which_column(cell_number)
    cell_number % 9
  end

  def which_box(cell_number)
    3 * (which_row(cell_number) / 3) + (which_column(cell_number) / 3)
  end
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


