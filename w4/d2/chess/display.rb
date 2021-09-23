require_relative './board.rb'
require_relative './cursor.rb'
require 'colorize'

class Display
  attr_reader :board, :board_object

  def initialize
    @board_object = Board.new
    @cursor_pos = Cursor.new([0,0], board)
  end 
  
  #need to add cursor to display at currrent square 
  #creating a method for the colors and use the cusor instance variabile. .cusor_pos if pos == input 

  def colors_for(index1, index2)
    if cursor.cursor_pos == [index1, index2] && cursor.selected
      color = :light_green
    elsif cursor.cursor_pos == [index1, index2]
      color = :light_red
    elsif (index1 + index2) % 2 == 1
      color = :light_blue 
    else 
      color = :light_yellow
    end
    {background: color}
  end

  def render
    @board_object.board.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        print "#{@board_object[[row_idx, col_idx]].piece_image}"
      end 
      print "\n"
    end
    return nil
  end
end