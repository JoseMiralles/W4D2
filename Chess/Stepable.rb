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
            # Check if it'll go out of the board then not in the result
            inside_x = true if replacement[0] <= 7 && replacement[0] >= 0 
            inside_y = true if replacement[1] <= 7 && replacement[1] >= 0
            if @board[replacement].color != self.color && inside_x && inside_y
                result << replacement 
            end
        end
        result
    end

end