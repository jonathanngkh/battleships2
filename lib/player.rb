require_relative 'board'

class Player
  def place ship, board
    board[0] = [ship]
  end

  def fire
    'You win!'
  end
end
