require './lib/grid.rb'
require './lib/cell.rb'

describe Grid do

  context "initialization" do
    let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
    #it's an easy puzzle row by row
    let(:grid) {Grid.new(puzzle)}
    before(:all) {
      puts grid.to_s
    }

    it "should have 81 cells" do
      expect(grid.cells.count).to eq(81)
    end

    it "should have an unsolved first cell" do
     expect(grid.cells.first.value).to eq(0)
    end

    it "should have a solved second cell with a value of 1" do
      expect(grid.cells[1].value).to eq(1)
    end

    it "should organise the cells into rows" do
    expect(grid.row.length).to eq(9)
    end

    it "should organise the cells into columns" do
      expect(grid.column.length).to eq(9)
    end

    # it "should organise the cells into boxes" do
    # false
    # end
  end

  context "structure and index" do
    let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
    let(:grid) {Grid.new(puzzle)}

    it "should know which row a cell is in" do
      expect(grid.which_row(27)).to eq(3)
      expect(grid.which_row(78)).to eq(8)
    end

    it "should know which column a cell is in" do
      expect(grid.which_column(27)).to eq(0)
      expect(grid.which_column(78)).to eq(6)
    end

    it "should know which box a cell is in" do
      expect(grid.which_box(27)).to eq(3)
      expect(grid.which_box(78)).to eq(8)
    end

    it "should know which box row a box is in" do
      expect(grid.box_row_position(24)).to eq(0)
      expect(grid.box_row_position(27)).to eq(1)
      expect(grid.box_row_position(78)).to eq(2)
    end


    it "should know the first row of any box" do
      expect(grid.first_row_of_box(6)).to eq(0)
      expect(grid.first_row_of_box(30)).to eq(3)
      expect(grid.first_row_of_box(54)).to eq(6)
    end

    it "should know which box column a box is in" do
      expect(grid.box_column_row(18)).to eq(0)
      expect(grid.box_column_row(48)).to eq(1)
      expect(grid.box_column_row(78)).to eq(2)
    end

    it "should know the first column of any box" do
      expect(grid.first_column_of_box(18)).to eq(0)
      expect(grid.first_column_of_box(48)).to eq(3)
      expect(grid.first_column_of_box(78)).to eq(6)
    end

    it "should know the cell index of a box" do 
      expect(grid.first_cell_of_box_index(20)).to eq(0)
      expect(grid.first_cell_of_box_index(67)).to eq(57)
      expect(grid.first_cell_of_box_index(16)).to eq(6)
    end

    it "should know all the box indices" do
      expect(grid.box_indices(67)).to eq([57,58,59,66,67,68,75,76,77])
    end

    it "should know all the row neighbours indices for a cell" do
      expect(grid.row_neighbour_indices(71)).to eq([63, 64, 65, 66, 67, 68, 69, 70, 71])
    end


    it "should know all the column neighbours for a cell" do
      expect(grid.column_neighbour_indices(71)).to eq([8,17,26,35,44,53,62,71,80]) 
    end

    it "should know ALL the neighbour indices for a given cell" do
      expect(grid.all_neighbour_indices(71)).to eq([8,17,26,35,44,53,62,71,80,63,64,65,66,67,68,69,70,71,60,61,62,69,70,71,78,79,80])
    end
  end

  context "neighbours" do
    let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
    let(:grid) {Grid.new(puzzle)}

    it "should know the value of a given cell" do
      expect(grid.cells[8].value).to eq(2)
    end 

    it "should know all the neighbour values of a given cell" do
      expect(grid.neighbours(8)).to eq([2,6,0,7,0,0,0,5,0,0,1,5,0,0,3,0,0,2,0,0,2,9,0,6,4,3,0])
    end
  end

  context "solving sudoku" do
    let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
    let(:grid) {Grid.new(puzzle)}

    it "should know if the puzzle is solved" do
      expect(grid.solved?).to be_false
    end

    it "can solve the puzzle" do
      grid.solve
      puts grid.to_s
      expect(grid.solved?).to be_true
      expect(grid.grid_string).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
    end
    
  end
end

