# require 'byebug'
# require 'require_all'

#Dir["/mnt/c/Users/tharp/Desktop/Pair Programming/Employee_Classes/Aa_classwork/w4/d2/lib/*.rb"].each {|file| require file }
Dir["/Users/williamwinzeler/Desktop/App_academy/aa_coursework/w4/d2/chess/pieces/*.rb"].each {|file| require file }

class Board
  attr_reader :board

  BACK_RANK = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

  def self.build_board
    rows = Array.new(8){Array.new(8)}
    @board = rows 
    rows.each_with_index do |row, file|
      row.each_with_index do |tile, idx|
        if file == 1
          rows[file][idx] = Pawn.new(@board, [file, idx], :W)
        elsif file == 6
          rows[file][idx] = Pawn.new(@board, [file, idx], :B)
        elsif file == 0
          rows[file][idx] = BACK_RANK[idx].new(@board, [file, idx], :W)
        elsif file == 7
          rows[file][idx] = BACK_RANK[idx].new(@board, [file, idx], :B)
        else
          rows[file][idx] = NullPiece.instance    
        end
      end
    end
    rows 
  end

  def initialize(board)
    @board = board 
    # private 
    # @sentinal = NullPiece
  end

  def move_piece(start, end_pos)
    if valid_move?(start, end_pos)
      x, y = start
      i, j = end_pos
      @board[i][j] = self.board[x][y]
      @board[x][y] = NullPiece.instance
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
    return false if !@board[start_pos[0]][start_pos[1]].color == :X #is there a piece at start pos? 
    return false if @board[end_pos[0]][end_pos[1]].color == @board[start_pos[0]][start_pos[1]].color   #Check to see if End pos is filled with same color piece 
    #TODO check to see if pieces can move the way the arguments suggest

    true 
  end

  # def render
  #   @board.each_with_index do |row, row_idx|
  #     row.each_with_index do |col, col_idx|
  #       print "#{@board[row_idx][col_idx].piece_image}"
  #     end 
  #     print "\n"
  #   end
  #   return nil
  # end

  # def inspect
  #   "#{piece_image}"
  # end




end