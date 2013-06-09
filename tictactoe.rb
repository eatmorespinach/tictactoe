class Tictactoe

  attr_accessor :grid, :chances

  def initialize()
    @chances = 9
    @grid = [[], [], []]
    setup_grid
  end
  
  def setup_grid
  	#@grid = [[1,2,3], [4,5,6], [7,8,9]]
    i = 0
  	(0..2).each do |y|
  		(0..2).each do |x|
  			i += 1
  			@grid[x][y] = i
			end  		
    end
  end

  def draw_board
    print "\n"
    print " " 	 
 	  (0..2).each do |y|
		  (0..2).each do |x|
        print @grid[x][y]
        print " "
			end
		  print "\n\n "
		end
	end

  #prints 1 2 3 on first line with |x| .each line, then 4 5 6 on 2nd line.  
	def which_player?
		@chances % 2 == 0 ? 2 : 1  #if chances turn is odd, player 1 will display
	end

	def pos_to_coords(position)
		case position
		when 1
			return [0,0]
		when 2
			return [1,0]
		when 3
			return [2,0]
		when 4
			return [0,1]
		when 5
			return [1,1]
		when 6 
			return [2,1]
		when 7
			return [0,2]
		when 8 
			return [1,2]
		when 9
			return [2,2]
		end
	end

  def check_for_win(pos1, pos2, pos3)
  		coords1 = pos_to_coords(pos1)
  		coords2 = pos_to_coords(pos2)
  		coords3 = pos_to_coords(pos3)
  		x1 = coords1[0]
  		y1 = coords1[1]
  		x2 = coords2[0]
  		y2 = coords2[1]
  		x3 = coords3[0]
  		y3 = coords3[1]
  		if (grid[x1][y1] == grid[x2][y2] && grid[x2][y2] == grid[x3][y3])
  			return true
  		else
  			return false
  		end
  	end

	#checks grid at element position. If there's number, spot is open, else spot is taken
  def grid_has?(position)
  	coords = pos_to_coords(position)
  	x = coords[0]
  	y = coords[1]

  	if grid[x][y].is_a? Fixnum #number
  		return true #position is empty
  	else
  		return false # position is full
  	end
  end

 def put_mark_on_board(position, player)
  	coords = pos_to_coords(position)
  	x = coords[0]
  	y = coords[1]

  	if player == 1
  		@grid[x][y] = "X"
  	else
  		@grid[x][y] = "O"
  	end
  	@chances -= 1
 end


  def move(position, player)
    if grid_has?(position)
    	put_mark_on_board(position, player)
    else
      puts "That spot has been taken.\n"
      return true
    end
    return false
  end

  def tie?
  	@chances == -1 ? true : false
  end

  def win?
  	# Attempt to check horizontals
 	(0..2).each do |y|
 		if (@grid[0][y] == @grid[1][y] && @grid[1][y] == @grid[2][y])
 			return true
 		end
 	end

 	# Attempt to check verticals
 	(0..2).each do |x|
 		if (@grid[x][0] == @grid[x][1] && @grid[x][1] == @grid[x][2])
 			return true
 		end
 	end

 	# check diagonals
 	(check_for_win(1,5,9) || check_for_win(3,5,7)) ? true : false
  end

end