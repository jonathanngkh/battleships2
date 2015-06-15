require_relative 'ship'

class Board
  def dimensions num
    board = Array.new(num){Array.new(num)}
  end
end
