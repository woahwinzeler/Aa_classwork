module Slideable
  attr_reader :DIAGNOL_DIRS, :HORIZONTAL_DIRS
  
  private 
  def move_dirs
    #We're leaving it blank to be overwritten by the subclass
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    #Grow in all directions until it hits a block: piece or the end of the board
  end

  DIAGNOL_DIRS = [[1,1], [1, -1], [-1,1], [-1, -1]]
  HORIZONTAL_DIRS = [[1,0],[0,1], [-1, 0], [0,-1]]

end