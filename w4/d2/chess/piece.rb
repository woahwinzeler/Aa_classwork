
require_relative './board.rb'

class Piece 
  attr_reader :color, :board, :pos

  def initialize(board, pos, color)
    @pos = pos #array
    @color = color #white or black
    @board = board 
  end

  def to_s

  end

  def empty?

  end

  def moves
    #returns an array of position an array can move to
    #We will need our subclasses to write this funciton

  end

  def pos=(val)

  end

  private

  def move_into_check?(end_pos)

  end

end