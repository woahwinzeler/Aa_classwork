require_relative "./piece.rb"
require 'byebug'

class Board
  attr_reader :rows

  def self.build_board
    @rows.each_with_index do |row, file|
      row.each do |tile|
        if file < 3 or file > 5
          tile = Piece.new
        end 
      end
    end
  end

  def initialize()
    @rows = Array.new(8){Array.new(8)}
    
    # private 
    # @sentinal = NullPiece
  end

  def move_piece(start, end_pos)
    if valid_pos?(end_pos)
      @row[start] = nil
      @row[end_pos] = self
    end 
  end

  def add_piece(piece, pos)
    @rows[pos] = piece 
  end

  def [](pos)
    x, y = pos
    @rows[x][y] 
  end

  def []=(pos, value)
    x, y = pos
    @rows[x][y] = value 
  end

  def valid_pos?(pos)
    #not done 
    x, y = pos
  end
end