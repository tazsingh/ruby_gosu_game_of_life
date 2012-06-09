class Cell
  attr_accessor :colour

  def alive?
    self.is_a? Alive
  end
end