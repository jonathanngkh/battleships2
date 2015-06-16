require_relative 'ship'

class Board

  attr_accessor :fleet

  def initialize
    @fleet = []
  end

  def place(ship, location)
    ship.position = location.split(', ')
    ship.lives = ship.position.length
    fleet << ship
  end

  def fire(location)
    fleet.each do |ship|
      if ship.position.include?(location)
        ship.hit
        return 'Hit!' 
      else
        return 'Miss!'
      end
    end
  end

end