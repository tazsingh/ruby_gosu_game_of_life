class Unit
  attr_accessor :cell

  def initialize window, x, y, cell = nil
    @window, @x, @y = window, x, y

    @cell = unless cell.nil?
      cell
    else
      if rand(10) > 4
        Alive.new
      else
        Dead.new
      end
    end
  end

  def draw
    @window.draw_quad @x, @y, @cell.colour,
                      @x + GameOfLife::GRID_PIXEL_SIZE, @y, @cell.colour,
                      @x + GameOfLife::GRID_PIXEL_SIZE, @y + GameOfLife::GRID_PIXEL_SIZE, @cell.colour,
                      @x, @y + GameOfLife::GRID_PIXEL_SIZE, @cell.colour
  end
end