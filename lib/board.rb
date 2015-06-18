require_relative 'ship'

class Board

  attr_accessor :fleet, :allowed_locations, :copy_of_ship_locations, :placed_ships, :cells
  def initialize
    @fleet = []
    @allowed_locations = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9", "I10", "J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10"]
    @placed_ships = []
    @cells = {"A1" => '', "B1" => '', "C1" => '', "D1" => '', "E1" => '', "F1" => '', "G1" => '', "H1" => '', "I1" => '',
    "J1" => '',

    "A2" => '', "B2" => '', "C2" => '', "D2" => '', "E2" => '', "F2" => '', "G2" => '', "H2" => '', "I2" => '', "J2" => '',

    "A3" => '', "B3" => '', "C3" => '', "D3" => '', "E3" => '', "F3" => '', "G3" => '', "H3" => '', "I3" => '', "J3" => '',

    "A4" => '', "B4" => '', "C4" => '', "D4" => '', "E4" => '', "F4" => '', "G4" => '', 'H4' => '', 'I4' => '', 'J4' => '',

    'A5' => '', 'B5' => '', 'C5' => '', 'D5' => '', 'E5' => '', 'F5' => '', 'G5' => '', 'H5' => '', 'I5' => '', 'J5' => '',

    'A6' => '', 'B6' => '', 'C6' => '', 'D6' => '', 'E6' => '', 'F6' => '', 'G6' => '', 'H6' => '', 'I6' => '', 'J6' => '',

    'A7' => '', 'B7' => '', 'C7' => '', 'D7' => '', 'E7' => '', 'F7' => '', 'G7' => '', 'H7' => '', 'I7' => '', 'J7' => '',

    'A8' => '', 'B8' => '', 'C8' => '', 'D8' => '', 'E8' => '', 'F8' => '', 'G8' => '', 'H8' => '', 'I8' => '', 'J8' => '',

    'A9' => '', 'B9' => '', 'C9' => '', 'D9' => '', 'E9' => '', 'F9' => '', 'G9' => '', 'H9' => '', 'I9' => '', 'J9' => '',

    'A10' => '', 'B10' => '', 'C10' => '', 'D10' => '', 'E10' => '', 'F10' => '', 'G10' => '', 'H10' => '', 'I10' => '', 'J10' => '',
  }
  end

  def place(ship, location)
    fail "You cant place a ship here" if placed_ships.include?(location)
    ship.position = location.split(', ')
    self.copy_of_ship_locations = location.split(', ')
    compare
    ship.lives = ship.position.length
    fleet << ship
    placed_ships << location
    board_place(copy_of_ship_locations[0])
    board_place(copy_of_ship_locations[1])
    board_place(copy_of_ship_locations[2])
    board_place(copy_of_ship_locations[3])
    board_place(copy_of_ship_locations[4])
    board_place(copy_of_ship_locations[5])
    print_board


  end

  def fire(location)
    fleet.each do |ship|
      if ship.position.include?(location)
        ship.hit(location)
        fleet.delete_if { |ship| ship.lives == 0 }
        print_board_hit(location)
        puts_hit
        puts "Game over!" if won?
        break
      end
        print_board_miss(location)
        puts "Miss!"
    end
  end

  def won?
    fleet == []
  end

  def puts_hit
    puts 'Hit!'
  end

  def compare
    allowed_locations.delete_if do |allowedLocation|
      self.copy_of_ship_locations.include?(allowedLocation)
    end
  end

  def print_board_hit(location)
    require 'terminal-table'

    self.cells[location] = '💥'

    table = Terminal::Table.new do |rows|
    rows << ['', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
    rows << :separator
    rows << [1, cells['A1'], cells['B1'], cells['C1'], cells['D1'], cells['E1'], cells['F1'], cells['G1'], cells['H1'], cells['I1'], cells['J1']]
    rows << :separator
    rows << [2, cells['A2'], cells['B2'], cells['C2'], cells['D2'], cells['E2'], cells['F2'], cells['G2'], cells['H2'], cells['I2'], cells['J2']]
    rows << :separator
    rows << [3, cells['A3'], cells['B3'], cells['C3'], cells['D3'], cells['E3'], cells['F3'], cells['G3'], cells['H3'], cells['I3'], cells['J3']]
    rows << :separator
    rows << [4, cells['A4'], cells['B4'], cells['C4'], cells['D4'], cells['E4'], cells['F4'], cells['G4'], cells['H4'], cells['I4'], cells['J4']]
    rows << :separator
    rows << [5, cells['A5'], cells['B5'], cells['C5'], cells['D5'], cells['E5'], cells['F5'], cells['G5'], cells['H5'], cells['I5'], cells['J5']]
    rows << :separator
    rows << [6, cells['A6'], cells['B6'], cells['C6'], cells['D6'], cells['E6'], cells['F6'], cells['G6'], cells['H6'], cells['I6'], cells['J6']]
    rows << :separator
    rows << [7, cells['A7'], cells['B7'], cells['C7'], cells['D7'], cells['E7'], cells['F7'], cells['G7'], cells['H7'], cells['I7'], cells['J7']]
    rows << :separator
    rows << [8, cells['A8'], cells['B8'], cells['C8'], cells['D8'], cells['E8'], cells['F8'], cells['G8'], cells['H8'], cells['I8'], cells['J8']]
    rows << :separator
    rows << [9, cells['A9'], cells['B9'], cells['C9'], cells['D9'], cells['E9'], cells['F9'], cells['G9'], cells['H9'], cells['I9'], cells['J9']]
    rows << :separator
    rows << [10, cells['A10'], cells['B10'], cells['C10'], cells['D10'], cells['E10'], cells['F10'], cells['G10'], cells['H10'], cells['I10'], cells['J10']]

    end

    puts table
  end

  def print_board_miss(location)
    require 'terminal-table'

    self.cells[location] = '🙅'

    table = Terminal::Table.new do |rows|
    rows << ['', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
    rows << :separator
    rows << [1, cells['A1'], cells['B1'], cells['C1'], cells['D1'], cells['E1'], cells['F1'], cells['G1'], cells['H1'], cells['I1'], cells['J1']]
    rows << :separator
    rows << [2, cells['A2'], cells['B2'], cells['C2'], cells['D2'], cells['E2'], cells['F2'], cells['G2'], cells['H2'], cells['I2'], cells['J2']]
    rows << :separator
    rows << [3, cells['A3'], cells['B3'], cells['C3'], cells['D3'], cells['E3'], cells['F3'], cells['G3'], cells['H3'], cells['I3'], cells['J3']]
    rows << :separator
    rows << [4, cells['A4'], cells['B4'], cells['C4'], cells['D4'], cells['E4'], cells['F4'], cells['G4'], cells['H4'], cells['I4'], cells['J4']]
    rows << :separator
    rows << [5, cells['A5'], cells['B5'], cells['C5'], cells['D5'], cells['E5'], cells['F5'], cells['G5'], cells['H5'], cells['I5'], cells['J5']]
    rows << :separator
    rows << [6, cells['A6'], cells['B6'], cells['C6'], cells['D6'], cells['E6'], cells['F6'], cells['G6'], cells['H6'], cells['I6'], cells['J6']]
    rows << :separator
    rows << [7, cells['A7'], cells['B7'], cells['C7'], cells['D7'], cells['E7'], cells['F7'], cells['G7'], cells['H7'], cells['I7'], cells['J7']]
    rows << :separator
    rows << [8, cells['A8'], cells['B8'], cells['C8'], cells['D8'], cells['E8'], cells['F8'], cells['G8'], cells['H8'], cells['I8'], cells['J8']]
    rows << :separator
    rows << [9, cells['A9'], cells['B9'], cells['C9'], cells['D9'], cells['E9'], cells['F9'], cells['G9'], cells['H9'], cells['I9'], cells['J9']]
    rows << :separator
    rows << [10, cells['A10'], cells['B10'], cells['C10'], cells['D10'], cells['E10'], cells['F10'], cells['G10'], cells['H10'], cells['I10'], cells['J10']]

    end

    puts table
  end

  def board_place(location)
    require 'terminal-table'

    self.cells[location] = '⛵'
    table = Terminal::Table.new do |rows|
    rows << ['', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
    rows << :separator
    rows << [1, cells['A1'], cells['B1'], cells['C1'], cells['D1'], cells['E1'], cells['F1'], cells['G1'], cells['H1'], cells['I1'], cells['J1']]
    rows << :separator
    rows << [2, cells['A2'], cells['B2'], cells['C2'], cells['D2'], cells['E2'], cells['F2'], cells['G2'], cells['H2'], cells['I2'], cells['J2']]
    rows << :separator
    rows << [3, cells['A3'], cells['B3'], cells['C3'], cells['D3'], cells['E3'], cells['F3'], cells['G3'], cells['H3'], cells['I3'], cells['J3']]
    rows << :separator
    rows << [4, cells['A4'], cells['B4'], cells['C4'], cells['D4'], cells['E4'], cells['F4'], cells['G4'], cells['H4'], cells['I4'], cells['J4']]
    rows << :separator
    rows << [5, cells['A5'], cells['B5'], cells['C5'], cells['D5'], cells['E5'], cells['F5'], cells['G5'], cells['H5'], cells['I5'], cells['J5']]
    rows << :separator
    rows << [6, cells['A6'], cells['B6'], cells['C6'], cells['D6'], cells['E6'], cells['F6'], cells['G6'], cells['H6'], cells['I6'], cells['J6']]
    rows << :separator
    rows << [7, cells['A7'], cells['B7'], cells['C7'], cells['D7'], cells['E7'], cells['F7'], cells['G7'], cells['H7'], cells['I7'], cells['J7']]
    rows << :separator
    rows << [8, cells['A8'], cells['B8'], cells['C8'], cells['D8'], cells['E8'], cells['F8'], cells['G8'], cells['H8'], cells['I8'], cells['J8']]
    rows << :separator
    rows << [9, cells['A9'], cells['B9'], cells['C9'], cells['D9'], cells['E9'], cells['F9'], cells['G9'], cells['H9'], cells['I9'], cells['J9']]
    rows << :separator
    rows << [10, cells['A10'], cells['B10'], cells['C10'], cells['D10'], cells['E10'], cells['F10'], cells['G10'], cells['H10'], cells['I10'], cells['J10']]

    end
  end

  def print_board
    require 'terminal-table'

    table = Terminal::Table.new do |rows|
    rows << ['', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
    rows << :separator
    rows << [1, cells['A1'], cells['B1'], cells['C1'], cells['D1'], cells['E1'], cells['F1'], cells['G1'], cells['H1'], cells['I1'], cells['J1']]
    rows << :separator
    rows << [2, cells['A2'], cells['B2'], cells['C2'], cells['D2'], cells['E2'], cells['F2'], cells['G2'], cells['H2'], cells['I2'], cells['J2']]
    rows << :separator
    rows << [3, cells['A3'], cells['B3'], cells['C3'], cells['D3'], cells['E3'], cells['F3'], cells['G3'], cells['H3'], cells['I3'], cells['J3']]
    rows << :separator
    rows << [4, cells['A4'], cells['B4'], cells['C4'], cells['D4'], cells['E4'], cells['F4'], cells['G4'], cells['H4'], cells['I4'], cells['J4']]
    rows << :separator
    rows << [5, cells['A5'], cells['B5'], cells['C5'], cells['D5'], cells['E5'], cells['F5'], cells['G5'], cells['H5'], cells['I5'], cells['J5']]
    rows << :separator
    rows << [6, cells['A6'], cells['B6'], cells['C6'], cells['D6'], cells['E6'], cells['F6'], cells['G6'], cells['H6'], cells['I6'], cells['J6']]
    rows << :separator
    rows << [7, cells['A7'], cells['B7'], cells['C7'], cells['D7'], cells['E7'], cells['F7'], cells['G7'], cells['H7'], cells['I7'], cells['J7']]
    rows << :separator
    rows << [8, cells['A8'], cells['B8'], cells['C8'], cells['D8'], cells['E8'], cells['F8'], cells['G8'], cells['H8'], cells['I8'], cells['J8']]
    rows << :separator
    rows << [9, cells['A9'], cells['B9'], cells['C9'], cells['D9'], cells['E9'], cells['F9'], cells['G9'], cells['H9'], cells['I9'], cells['J9']]
    rows << :separator
    rows << [10, cells['A10'], cells['B10'], cells['C10'], cells['D10'], cells['E10'], cells['F10'], cells['G10'], cells['H10'], cells['I10'], cells['J10']]
    end

    puts table
  end
end
