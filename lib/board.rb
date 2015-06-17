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
        ship.hit(location)
        puts_hit
        fleet.delete_if { |ship| ship.lives == 0 }
        puts "Game over!" if won?
      else
        return 'Miss!'
      end
    end
  end

  def won?
    fleet == []
  end

  def puts_hit
    puts 'Hit!'
  end
end
