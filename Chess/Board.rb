require_relative "Piece.rb"

class Board

    attr_accessor :rows

    def initialize()
        @rows = Array.new(8) { Array.new(8) }
        self.set_pieces
    end

    def set_pieces
        rows[0..1].map! do |row|
            row.map! do |square|
                Piece.new
            end
            row
        end
        rows[-2..-1].map! do |row|
            row.map! do |square|
                Piece.new
            end
            row
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
        raise "No piece in selected position!" if self[start_pos] == nil
        is_out = end_pos[0] < 0 || end_pos[0] > 7 || end_pos[1] < 0 || end_pos[1] > 7
        raise "Can't move to end position!" if is_out

        piece = self[start_pos]
        self[start_pos] = nil
        self[end_pos] = piece
    end

    def render
        rows.each do |row|
            row.each do |square|
                print square.to_s
                print " "
            end
            puts
        end
    end

end

board = Board.new()
board.render