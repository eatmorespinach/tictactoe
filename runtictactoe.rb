require_relative "tictactoe"


class TictactoeRunner

  def self.run 
    @game = Tictactoe.new() #starts a new game
    
    while true
    	player = @game.which_player?
	 	loop do
	 		@game.draw_board
	 		puts "------------"
	 		print "Player #{player} choose your position: "
	 		position = gets.chomp.to_i
	 		retrytictac = @game.move(position,player)
	 		
	 		break if retrytictac == false
	 	end
	 	  
	    if @game.win?
	    	puts "\n\n"
	    	@game.draw_board
	    	puts "\n\nCongratulations player #{player}! You won tic tac toe!"
	    	break
	 	elsif @game.tie? == true
	 		puts "\n\n"
	    	@game.draw_board
	 		puts "\n\nGame tied! \n"	
	     	break
	    end
	    puts "------------"
    end
  end
end 

TictactoeRunner.run