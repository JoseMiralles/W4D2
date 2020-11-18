require "singleton"
class Piece

    attr_reader :color

    def initialize(color = nil)
        @color = color
    end

    def to_s
        :P
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