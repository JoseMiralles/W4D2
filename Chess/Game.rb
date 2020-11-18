require_relative "board.rb"
require_relative "king.rb"

board = Board.new
king = King.new(:black, board, [2,2])
board[[2,2]] = king

board.render

p king.moves