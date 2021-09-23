require_relative "./piece.rb"
require_relative "./stepable.rb"

class King < Piece
  include Stepable
  attr_reader :color, :piece_image
  
  
  def initialize(board, pos, color)
    super(board, pos, color)
    if color == :W
      @piece_image = '♔'
    else
      @piece_image = '♚'
    end 
  end

  def move_difs(current_pos)
    moves = [[1,1], [1,0], [-1, 0], [0,-1], [0,1], [-1,1], [-1,-1], [1,-1]]
    possible_moves = []
    moves.each do |move|
      new_pos = [move[0] + current_pos[0], move[1] + current_pos[1]]
      possible_moves << new_pos if @board.valid_move?(current_pos, new_pos)
    end 
  end
end