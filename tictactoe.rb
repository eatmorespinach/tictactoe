#a tic tac to board is drawn. This will be either a 3d array or 3d hash

#grid = [[1,2,3], [4,5,6], [7,8,9]]

#replace array values with X or O

#grid = [[1,2,X], [4,5,6], [7,8,9]]

#check for winning row 


#player one enters a number between 1 and 9 

#the number in array then gets crossed out with X

#terminal then switches between X and O

#player two enters a number between 1 and 9, the number in array then gets crosses out with X


class Tictactoe

  attr_accessor :grid, :chances

  def initialize()
    @chances = 9
    # @word    = LIST.sample
    @grid = setup_grid

  end
  
  def setup_grid
  		@grid = [[1,2,3], [4,5,6], [7,8,9]]
  end


  def draw_board 	 
 	 	(0..2).each do |x|
			(0..2).each do |y|
				print @grid[x][y]
			end
			print "\n"
		end
	end

	def which_player?
		@chances % 2 == 0 ? 2 : 1
	end

	def pos_to_coords(position)
		case position
		when 1
			return [0,0]
		when 2
			return [0,1]
		when 3
			return [0,2]
		when 4
			return [1,0]
		when 5
			return [1,1]
		when 6 
			return [1,2]
		when 7
			return [2,0]
		when 8 
			return [2,1]
		when 9
			return [2,2]
		end
	end


	#checks grid at element position. If there's number, spot is open, else spot is taken
  def grid_has?(position)
  	pos = position
  	coords = pos_to_coords(pos)
  	x = coords[0]
  	y = coords[1]

  	if grid[x][y].is_a? Fixnum #number
  		return true #position is empty
  	else
  		return false # position is full
  	end
  end



 def put_mark_on_board(position, player)
  	pos = position
  	coords = pos_to_coords(pos)
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


  def win?
  	# check(check_coords[0][0],check_coords[0][1],check_coords[0][2])

  	
  	#grid = [[1,2,3], [4,5,6], [7,8,9]]

  	#horizontal

  	(0..2).each do |i|
			if grid[i][0] == grid[i][1] && grid[i][1] == grid[i][2]
				return true
				break
			elsif grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i]
				return true
				break
			elsif grid[0][0] == grid[1][1] && grid[2][2] == grid[3][3]
				return true
				break
			elsif
				grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0]
				return true
				break
			else 
				return false
			end
		end
	end

# 	def check_coords (a, b, c)
# 		if (a == b)
# 			if (b == c)
# 				return true
# 			end
# 		else
# 			return false
# 		end
# 	end

#   def tie?
#     if counter == 0
#       	return true
#   	end
#   end

end




  # 	if gridarray[0][0] && gridarray[0][1] && gridarray[0][2] == "X" || "O"
  # 		return true 
  # 	# if gridarray[0][0] && gridarray[0][1] && gridarray[0][2] == "X" || "O"
  # 	# 	return true 
  # 	elsif gridarray[1][0] == gridarray[1][1] == gridarray[1][2]
  # 		return true
  # 	elsif gridarray[2][0] == gridarray[2][1] == gridarray[2][2]
		# 	return true
		
		# #vertical 3 in a rows
		# elsif gridarray[0][0] == gridarray[1][0] == gridarray[2][0] 
		# 	return true
		# elsif gridarray[0][1] == gridarray[1][1] == gridarray[2][1]
		# 	return true
		# elsif gridarray[0][2] == gridarray[1][2] == gridarray[2][2]
		
		# #diagonal 3 in a rows
		# elsif gridarray[0][0] == gridarray[1][1] == gridarray[2][2]
		# 	return true
		# elsif gridarray[0][2] == gridarray[1][1] == gridarray[2][0]
		# 	return true
		# else
		# 	return false
  # end


   # 	#horizontal 3 in a rows	
		# (0..2).each do |y|
		# 	first_column = grid[0][y]
		# 	won = true
		# 	(0..2).each do |x| 
		# 		won = won && (grid[x][y] == first_column)
		# 	end
		# 		return true if won
		# end

		# #horizontal 3 in a rows
		# (0..2).each do |x|
		# 	first_row = grid[0][x]
		# 		won = true
		# 	(0..2).each do |x|
		# 		won = won && (grid[x][y] == first_row)
		# 	end
		# 		return true if won
		# end

		# diagonal 3 in a rows
		# (0..2).each do |i|
		# 	if grid[i][x] = grid[x][i]
		# 		return true if won
	