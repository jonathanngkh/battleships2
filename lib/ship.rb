class Ship
  attr_accessor :position, :lives

  def initialize
    @position = []
  end

  def hit(location)
    self.lives = self.lives - 1
    position.delete_if { |coordinate| coordinate == location }
  end
end
