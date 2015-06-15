require_relative 'ship'

class Board
  def dimensions num
    board = ['0']
    board = board * num
    board = [board] * num
  end
end
