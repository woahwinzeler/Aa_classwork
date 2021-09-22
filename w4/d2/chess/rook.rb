require_relative "./piece.rb"
require_relative "./slideable.rb"

class Rook < Piece
    include Slideable 


    def move_dirs(start_pos)
        horizontals = HORIZONTAL_DIRS.dup 
        valid_moves = []
        directions = horizontals   
        directions.each do |dir|
            new_pos = [start_pos[0] + dir[0], start_pos[1] + dir[1]]
            if @board.valid_move?(new_pos, [1, 1])
                valid_moves << new_pos 
            end 
        end 
        valid_moves 
    end
end