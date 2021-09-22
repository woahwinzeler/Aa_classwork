require_relative './board.rb'
require_relative './cursor.rb'
require 'colorize'

class Display

  attr_reader :board 

  def initialize
    @board = Board.build_board
    @cursor_pos = Cursor.new([0,0], board)
  end 

  def render
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        print "#{@board[row_idx][col_idx].piece_image}"
      end 
      print "\n"
    end
    return nil
  end
end