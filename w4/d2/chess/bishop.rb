require_relative "./piece.rb"
require_relative "./slideable.rb"

class Bishop < Piece
    include Slideable 


    def move_dirs(start_pos)
        valid_moves = []
        directions = DIAGNOL_DIRS.dup
        directions.each do |dir|
            new_pos = [start_pos[0] + dir[0], start_pos[1] + dir[1]]
            if @board.valid_move?(new_pos, [1, 1])
                valid_moves << new_pos 
            end 
        end 
        valid_moves 
    end
end