require_relative "Piece.rb"
require_relative "Stepable.rb"

class King < Piece
    include Stepable

    def move_diffs
        return [ [-1, -1], [-1, 0], [-1, 1],
                 [0, -1],           [1, 0],
                 [1, -1], [1, 0], [1, 1] ]
    end

    def to_s
        return "♚".colorize(@c)
    end

end