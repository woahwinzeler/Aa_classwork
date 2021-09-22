require_relative "./piece.rb"


class NullPiece < Piece
  include Singelton 
  attr_reader :symbol 

  def initialize
    @symbol = @color
  end

  def moves

  end


  def empty?

  end

end