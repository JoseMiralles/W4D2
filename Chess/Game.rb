require_relative "board.rb"
require_relative "king.rb"
require_relative "knight"
require_relative "Rook"

board = Board.new
knight = Knight.new(:black, board, [3,2])
king = King.new(:white, board, [5,2])
rook = Rook.new(:black, board, [5,1])
board[[3,2]] = knight
board[[5,2]] = king
board[[5,1]] = rook

p rook.grow_unblocked_moves_in_dir(0,0)
board.render

p knight.moves
