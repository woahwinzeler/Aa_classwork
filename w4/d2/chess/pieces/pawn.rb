require_relative "./piece.rb"




class Pawn < Piece 
  attr_reader :color, :piece_image

  def move_dirs
    moves = [[0,2],[0,1],[1,1],[-1,1]]
  end

  def initialize(board, pos, color)
    super(board, pos, color)
    if color== :W
      @piece_image = '♙'
    else
      @piece_image = '♟'
    end
  end

  private 

  def at_start_row?
    if color == :W
      return false if pos[1] != 1
    else
      return false if pos[1] != 6 
    end
    true 
  end

  def forward_dir
    #Invert values of moves for black
    if color == :B 
      return moves *= -1
    else
      return moves
    end
  end

  def forward_steps
    #check if forward directions are valid
    possilbe_moves = self.forward_dir.take(2) 
    possilbe_moves.select{|move| @board.valid_move?(pos, move)}  
  end

  def side_attacks
    possilbe_moves = self.forward_dir.drop(2) 
    possilbe_moves.select{|move| @board.valid_move?(pos, move)}
  end

end