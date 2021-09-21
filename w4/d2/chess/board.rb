require_relative "./piece.rb"
require 'byebug'

class Board
  attr_reader :board

  def self.build_board
    rows = Array.new(8){Array.new(8)}
    rows.each_with_index do |row, file|
      row.each_with_index do |tile, idx|
        if file < 2 or file > 5
          rows[file][idx] = :A
        else
          rows[file][idx] = :O
        end
      end
    end
    rows 
  end

  def initialize
    @board = Board.build_board 
    
    # private 
    # @sentinal = NullPiece
  end

  def move_piece(start, end_pos, piece = :X)
    if valid_move?(end_pos)
      x, y = start
      i, j = end_pos
      @board[x][y] = nil
      @board[i][j] = piece
    end 
  end

  def add_piece(piece, pos)
    @board[pos] = piece 
  end

  def [](pos)
    x, y = pos
    @board[x][y] 
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value 
  end

  def valid_move?(start_pos, end_pos)
    pos = start_pos + end_pos
    pos.each { |x| return false if x < 0 || x > 7 } #checking if its on board
    return false if start_pos.nil? #is there a piece at start pos? End pos later
    true 
  end
end