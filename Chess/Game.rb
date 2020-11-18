require_relative "board.rb"
require_relative "king.rb"
require_relative "knight"

board = Board.new
knight = Knight.new(:black, board, [3,2])
king = King.new(:white, board, [5,2])
board[[3,2]] = knight
board[[5,2]] = king

board.render

p knight.moves