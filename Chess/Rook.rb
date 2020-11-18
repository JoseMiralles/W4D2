require_relative "Slidable.rb"

class Rook < Piece
    include Slidable

    HORIZONTAL_DIRS = [
        [0, -1], # left
        [0, 1], # right
        [-1, 0], # up (vertical)
        [1, 0]  # down (vertical)
    ].freeze

    DIAGONAL_DIRS = [].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end
    
    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def to_s
        '♜'.colorize(@c)
    end

    protected

    def move_dirs
        return [  ]
    end

end