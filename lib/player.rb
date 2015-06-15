require_relative 'board'

class Player
  def place ship, board
    board[0] = [ship]
  end

  def fire location, board
    board[0] = ['X']
  end
end
