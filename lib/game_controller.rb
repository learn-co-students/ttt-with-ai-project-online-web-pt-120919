class GameController
  
  def start
    puts "Welcome to Tic-Tac-Toe"
    print "Select the number of players 0-2: "
    player_number = gets.strip

    case player_number
      when "0"
        zero_player_game
      when "1"
        one_player_game
      when "2" 
        two_player_game
      when "wargames"
        wargames
      end 
  end
  
  def zero_player_game
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    game.play
  end 
  
  def one_player_game
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      game.play
  end 
    
  def two_player_game
      game = Game.new
      game.play
  end
  
  def wargames
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    
    player_x = 0 
    player_o = 0
    draw = 0
    
    100.times do 
      game.play
      player_x += 1 if game.winner == "X"
      player_o += 1 if game.winner == "O"
      draw += 1 if game.draw?
    end 
    
    puts "Player X won #{player_x} times in war games."
    puts "Player O won #{player_o} times in war games."
    puts "The number of draws were #{draw} in war games."
  end 
end 