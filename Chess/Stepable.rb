module Stepable

    def moves
        result = self.move_diffs
        result.map! do |move|
            # Check if there is a friendly piece, or it's out of bounds.
            replacement = []
            replacement[0] = move[0] + @pos[0]
            replacement[1] = move[1] + @pos[1]
            replacement
        end
        result
    end

end