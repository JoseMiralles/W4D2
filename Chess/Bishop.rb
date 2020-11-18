require_relative "Slidable.rb"

class Bishop < Piece
    includes Slidable

    HORIZONTAL_DIRS = [
    ].freeze

    DIAGONAL_DIRS = [
        [-1, -1],
        [-1, 1],
        [1, -1],
        [1, 1]
    ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end
    
    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def to_s
        '♝'.colorize(@c)
    end

    protected

    def move_dirs
        return [  ]
    end

end