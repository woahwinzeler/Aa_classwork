require_relative "./piece.rb"
require 'singleton'

class NullPiece < Piece
  include Singleton 
  attr_reader :piece_image

  def initialize
    @board = nil
    @color = :X 
    @pos = nil 
    @piece_image = " "
  end

  def moves

  end


  def empty?

  end

end