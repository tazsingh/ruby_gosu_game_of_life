require 'gosu'
require './game_of_life/unit'
require './game_of_life/cell'
require './game_of_life/cells/alive'
require './game_of_life/cells/dead'

class GameOfLife < Gosu::Window
  attr_accessor :grid

  GRID_PIXEL_SIZE = 6
  GRID_WIDTH = 150
  GRID_HEIGHT = 150

  def initialize
    super GRID_WIDTH * GRID_PIXEL_SIZE, GRID_HEIGHT * GRID_PIXEL_SIZE, false
    self.caption = "Game of Life"

    @grid = []
    (0..GRID_WIDTH).each do |x|
      row = []
      (0..GRID_HEIGHT).each do |y|
        row << Unit.new(self, x * GRID_PIXEL_SIZE, y * GRID_PIXEL_SIZE)
      end
      @grid << row
    end
  end

  def update
    temp_grid = []

    @grid.each_with_index do |row, x|
      temp_row = []

      row.each_with_index do |unit, y|
        alive = 0

        (-1..1).each do |y_diff|
          (-1..1).each do |x_diff|
            if x + x_diff >= 0 and x + x_diff <= GRID_WIDTH and y + y_diff >= 0 and y + y_diff <= GRID_HEIGHT
              alive += 1 if @grid[x + x_diff][y + y_diff].cell.alive?
            end
          end
        end

        if @grid[x][y].cell.alive?
          alive -= 1

          temp_row << Unit.new(self, x * GRID_PIXEL_SIZE, y * GRID_PIXEL_SIZE, if alive < 2
            Dead.new
          elsif alive == 2 or alive == 3
            Alive.new
          elsif alive > 3
            Dead.new
          else
            Alive.new
          end)
        else
          temp_row << Unit.new(self, x * GRID_PIXEL_SIZE, y * GRID_PIXEL_SIZE, if alive == 3
            Alive.new
          else
            Dead.new
          end)
        end

      end

      temp_grid << temp_row
    end

    @grid = temp_grid
  end

  def draw
    @grid.each do |row|
      row.each do |unit|
        unit.draw
      end
    end
  end
end

GameOfLife.new.show if ARGV.shift == 'show_window'
