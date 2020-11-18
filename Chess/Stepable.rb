module Stepable

    def moves
        diffs = self.move_diffs
        result = []
        diffs.each do |move|
            # Check if there is a friendly piece, or it's out of bounds.
            replacement = []
            replacement[0] = move[0] + @pos[0]
            replacement[1] = move[1] + @pos[1]
            # Check if there is a friendly piece here already.
            if @board[replacement].color != self.color
                result << replacement
            end
        end
        result
    end

end