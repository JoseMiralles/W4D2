require "singleton"
class Piece

    attr_reader :color

    def initialize(color = nil, board, pos)
        @color = color
        @board = board
        @pos = pos
        
        c = :blue if self.color == :white
        c = :red if self.color == :black
        @c = c
    end

    def to_s
        "P".colorize(@c)
    end

end

class NullPiece < Piece
    include Singleton 

    def initialize()
    end

    def to_s
        "-"
    end
end