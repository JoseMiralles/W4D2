module Slidable

    def moves
        
    end

    def grow_unblocked_moves_in_dir(x, y)
        new_x = x
        new_y = y
        result = []

        # While new_x and new_y are in bounds
        while new_x <= 7 && new_x >=0 && new_y <= 7 && new_y >=0
            # Calculate the new move
            move = [ (new_x + @pos[0]) , (new_y + @pos[1]) ]
            # Check if this is an enemy piece.
            if @board[move].color != nil && @board[move].color != self.color
                result << move
                break
            elsif @board[move].color == self.color
                break
            else
                result << move
            end
            new_x += x
            new_y += y
        end
        result
    end

end