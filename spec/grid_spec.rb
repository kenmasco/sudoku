require './lib/grid.rb'
require './lib/cell.rb'

describe Grid do
  context "initialization" do
    let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
    #it's an easy puzzle row by row
    let(:grid) {Grid.new(puzzle)}

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

  context "structure" do
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
  end

  context "solving" do
    let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
    let(:grid) {Grid.new(puzzle)}

    it "should check each cell to see if it is filled out" do
    end
  end
end

