require_relative "Piece.rb"
require_relative "Stepable.rb"

class King < Piece
    include Stepable

    def move_diffs
        return [ [-1, -1], [-1, 0], [-1, 1],
                 [0, -1],           [1, 0],
                 [1, -1], [1, 0], [1, 1] ]
    end

end

p King.new(nil ,nil ,[0,0]).moves