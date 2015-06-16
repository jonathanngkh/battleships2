class Board

  attr_accessor :fleet

  def initialize
    @fleet = []
  end

  def place(ship, location)
    fleet << ship
  end

end