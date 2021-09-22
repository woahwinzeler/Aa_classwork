require_relative "./piece.rb"
require_relative "./stepable.rb"





class Knight < Piece
  include Stepable
  attr_reader :color
  moves = [[2,1], [-2,1], [2,-1], [-2,-1], [1,2], [1,-2], [-1,2], [-1, -2]]

  def move_difs(current_pos)
    possible_moves = []
    moves.each do |move|
      new_pos = [move[0] + current_pos[0], move[1] + current_pos[1]]
      possible_moves << new_pos if @board.valid_move?(current_pos, new_pos)
    end 
  end

end