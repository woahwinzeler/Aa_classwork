require_relative './board.rb'
require 'cursor.rb'
require 'colorize'

class Display
  @cursor_pos = Cursor.new([0,0], board)

  
end