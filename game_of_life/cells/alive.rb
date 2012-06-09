class Alive < Cell
  def initialize
    colours = [Gosu::Color::BLACK, Gosu::Color::BLUE, Gosu::Color::AQUA, Gosu::Color::RED, Gosu::Color::GREEN, Gosu::Color::YELLOW, Gosu::Color::FUCHSIA]
    @colour = Gosu::Color::BLACK # colours[rand(colours.size)]
  end
end