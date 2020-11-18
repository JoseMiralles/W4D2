require_relative "Piece.rb"

class Board

    attr_accessor :rows

    def initialize()
        @rows = Array.new(8) { Array.new(8) }
        @null_piece = NullPiece.instance
        self.set_pieces

    end

    def set_pieces
        # Fill top two rows with black pieces
        rows[0..1].map! do |row|
            row.map! do |square|
                Piece.new(:black)
            end
            row
        end
        # Fill bottom two rows with white pieces
        rows[-2..-1].map! do |row|
            row.map! do |square|
                Piece.new(:white)
            end
            row
        end
        
        rows[2...-2].map! do |row|
            row.map! do |square|
                @null_piece
            end
        end
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @rows[pos[0]][pos[1]] = val
    end

    def move_piece(start_pos, end_pos)
        is_out = start_pos[0] < 0 || start_pos[0] > 7 || start_pos[1] < 0 || start_pos[1] > 7
        raise "Start position out of bounds!" if is_out
        raise "No piece in selected position!" if self[start_pos] == @null_piece
        is_out = end_pos[0] < 0 || end_pos[0] > 7 || end_pos[1] < 0 || end_pos[1] > 7
        raise "Can't move to end position!" if is_out
        raise "Can't attack own pieces!" if self[end_pos].color == self[start_pos].color

        piece = self[start_pos]
        self[start_pos] = @null_piece
        self[end_pos] = piece
    end

    def render
        rows.each_with_index do |row, idx1|
            row.each_with_index do |square, idx2|
                print square.to_s
                print " "
            end
            puts
        end
        puts
    end

end

board = Board.new()
board.render
board.move_piece([0,0], [3, 0])
board.move_piece([0,3], [4, 3])
board.move_piece([1,3], [3, 6])
board.render
# board.move_piece([4, 5], [0, 0])
# board.render