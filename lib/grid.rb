class Grid
  attr_accessor :cells

  def initialize(initial_values)
    @cells = initial_values.split('').map {|i| Cell.new(i.to_i)}    
  end

  def index
    (0..80).to_a
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

  def box_row_position(cell_number)
    which_box(cell_number) / 3
  end

  def first_row_of_box(cell_number)
    box_row_position(cell_number) * 3
  end

  def box_column_row(cell_number)
    which_box(cell_number) % 3
  end

  def first_column_of_box(cell_number)
    box_column_row(cell_number) * 3
  end

  def first_cell_of_box_index(cell_number)
    first_row_of_box(cell_number)*9 + first_column_of_box(cell_number) 
  end

  def box_indices(cell_number)
    n = first_cell_of_box_index(cell_number)
      [n, n+1, n+2, n+9, n+10, n+11, n+18, n+19, n+20]
  end


  def row_neighbour_indices(cell_number)
    row = which_row(cell_number)
    first = row*9
    last = first + 8
    (first..last).to_a
  end

  def column_neighbour_indices(cell_number)
    index.select {|cell| cell % 9 == which_column(cell_number)}
  end

  def all_neighbour_indices(cell_number)
    column_neighbour_indices(cell_number) + row_neighbour_indices(cell_number) + box_indices(cell_number)
  end
  
  def neighbours(cell_number)
    all_neighbour_indices(cell_number).map{|i| cells[i].value }
  end

  def solved?
    cells.all? {|cell|cell.value != 0}
  end
 
  # def solve
  #   while solved? == false

  # end




  def to_s
    cells.each_slice(9) do |row|
      puts row.map{|cell| cell.value }.inspect
    end
  end

  def grid_string
    arr = []
    cells.each do |cell|
      arr << cell.value
    end
    arr.flatten.join
  end

  def try_to_solve
    cells.each_with_index do |cell, index|
      if cell.value == 0 
        cell.solve(neighbours(index))
      end
    end
  end

  def solve
    outstanding_before = cells.count {|c| c.filled_out?}
    looping = false

    while !solved? && !looping
      try_to_solve #ask each cell to solve itself
      outstanding = cells.count {|c| c.filled_out?}
      looping = outstanding_before == outstanding
      outstanding_before = outstanding
    end
  end 

end

#   def inspect
#     #iterate over all cells and print the grid
#   end


