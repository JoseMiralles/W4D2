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
        rows[0..1].each_with_index do |row, idx_1|
            row.each_with_index do |square, idx_2|
                self[[idx_1, idx_2]] =  Piece.new(:black, self, [idx_1, idx_2])
            end
        end
        # Fill bottom two rows with white pieces
        (6..7).each do |idx1|
            (0..7).each do |idx2|
                self[[idx1, idx2]] =  Piece.new(:white, self, [idx1, idx2])
            end
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
        self.rows[pos[0]][pos[1]] = val
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

    # Prints board
    def render
        rows.each_with_index do |row, idx1|
            row.each_with_index do |piece, idx2|
                print " "
                print piece.to_s
                print " "
            end
            puts
        end
        puts
    end

end