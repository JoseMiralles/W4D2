module Slidable

    def moves
        
    end

    def grow_unblocked_moves_in_dir(x, y)
        new_x = @pos[0]
        new_y = @pos[1]
        result = []
        while new_x <= 7 && new_x >=0 && new_y <= 7 && new_y >=0
            move = [ (new_x + @pos[0]) , (new_y + @pos[1]) ]
            if @board[[new_x,new_y]].color != nil && @board[[new_x,new_y]].color != self.color
                result << move
                break
            elsif @board[[new_x,new_y]].color == self.color
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