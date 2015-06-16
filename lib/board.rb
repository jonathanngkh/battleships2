require_relative 'ship'

class Board

  attr_accessor :fleet

  def initialize
    @fleet = []
  end

  def place(ship, location)
    ship.position = location
    fleet << ship
  end

end