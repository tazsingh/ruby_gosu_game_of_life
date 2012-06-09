require './game_of_life'

describe GameOfLife do
  it "should have a grid" do
    g = GameOfLife.new

    g.should respond_to(:grid)
  end

  it "should have an initial population" do

  end
end