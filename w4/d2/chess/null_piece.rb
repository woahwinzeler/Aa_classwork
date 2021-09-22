require_relative "./piece.rb"
require 'singleton'

class NullPiece < Piece
  include Singleton 
  attr_reader :symbol 

  def initialize
    @board = nil
    @color = :X 
    @pos = nil 
  end

  def moves

  end


  def empty?

  end

end