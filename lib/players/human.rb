module Players
  
  class Human < Player
    def move(board)
      print "Enter board position 1-9: "
      input = gets.strip
    end 
  end 
end 