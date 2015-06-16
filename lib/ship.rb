class Ship
  attr_accessor :position, :lives

  def initialize
    @position = []
  end

  def lives
    @lives = position.length
  end
end

