require_relative 'board'

class Player
  def place ship, board
    board[0] = [ship]
  end
end
