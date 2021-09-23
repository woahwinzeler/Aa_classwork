require_relative "./piece.rb"
require_relative "./slideable.rb"

require 'byebug'



class Queen < Piece
    include Slideable 

    attr_reader :piece_image

    def initialize(board, pos, color)
      super(board, pos, color)
      if color == :W
        @piece_image = '♕'
      else
        @piece_image = '♛'
      end
    end

    #private 

    def move_dirs(start_pos)
        diaganols = DIAGNOL_DIRS.dup
        horizontals = HORIZONTAL_DIRS.dup 
        valid_moves = []
        directions = diaganols + horizontals   
        #debugger 
        directions.each do |dir|
            new_pos = [start_pos[0] + dir[0], start_pos[1] + dir[1]]
            if @board.valid_move?(start_pos, new_pos)
                valid_moves << new_pos 
                valid_moves << grow_unblocked_moves_in_dir(dir[0], dir[1])
            end 
        end 
        valid_moves 
    end

  #needs to be tested 
  def grow_unblocked_moves_in_dir(dx, dy)
    board = @board 
    x_val = self.pos[0] + dx 
    y_val = self.pos[1] + dy

    valid_growth = []

    while x_val >= 0 and x_val <= 7 and y_val >= 0 and y_val <= 7 
      if !board[x_val][y_val].color == :X && !board[x_val][y_val].color == self.color
        valid_growth << [x_val, y_val]
        break 
      elsif board[x_val][y_val].color == :X
        valid_growth << [x_val, y_val]
      else
        break 
      end
      x_val += dx  
      y_val += dy 
    end 
   
    valid_growth
  end

end