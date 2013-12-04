require './lib/cell.rb'

describe Cell do
  
    let(:cell) {Cell.new}
    

    it "should be empty by default" do
      expect(cell).not_to be_filled_out
    end

    it "should not be empty if it has a value" do
      cell.value = 4
      expect(cell).to be_filled_out
    end

    it "should have a value" do
      cell.value = 5
      expect(cell.value).to eq(5)
    end


    it "should solve itself if there's only one solution" do
      neighbours = [1,2,3,4,6,7,8,9]
      cell.solve(neighbours)
      expect(cell.value).to eq(5)
    end

    it "should not be able to solve itself if there's more than one solution" do
      neighbours = [1,2,3,4]
      cell.solve(neighbours)
      expect(cell).not_to be_filled_out
    end

  context "should know its possible values" do
    let(:cell) {Cell.new}

    it "given all neighbours but one" do
      expect(cell).not_to be_filled_out
      neighbours = [1,2,3,4,6,7,8,9]
      expect(cell.possible_values(neighbours)).to eq([5])
    end

    it "given all neighbour but two" do
      expect(cell).not_to be_filled_out
      neighbours = [3,4,5,6,7,8,9]
      expect(cell.possible_values(neighbours)).to eq([1,2])
    end
  end
end 