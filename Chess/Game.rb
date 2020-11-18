require_relative "board.rb"
require_relative "king.rb"
require_relative "knight"

board = Board.new
knight = Knight.new(:black, board, [6,0])
board[[6,0]] = knight

board.render

p knight.moves