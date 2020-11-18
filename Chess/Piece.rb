require "singleton"
class Piece

    attr_reader :color

    def initialize(color = nil, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        c = :blue if self.color == :white
        c = :red if self.color == :black
        "P".colorize(c)
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