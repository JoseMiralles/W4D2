require_relative "Piece.rb"
require_relative "Stepable.rb"
require "colorize"

class Knight < Piece
    include Stepable
    def move_diffs
       return  [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]
    end

    def to_s
        c = :blue if self.color == :white
        c = :red if self.color == :black
        "N".colorize(c)
    end
end