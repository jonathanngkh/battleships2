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

  def fire(location)
    fleet.each do |ship| 
      return 'Hit!' if ship.position == location
      return 'Miss!'
    end

  end
end