class Ship
  attr_accessor :position, :lives

  def initialize
    @position = []
  end

  def hit
    self.lives -= 1
  end


end

