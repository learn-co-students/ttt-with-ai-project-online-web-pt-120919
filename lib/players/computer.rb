module Players
  
  class Computer < Player
    def move(board)
      puts "Computer Move"
      
      combos = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
      ]
          
      def opponent_token
        self.token == "X" ? "O" : "X"
      end
      
      # If close to winning a game, select winning position
      combos.each do |combo|
        if combo.count {|i| board.cells[i] == opponent_token} == 2 
          position = combo.select {|i| board.cells[i] != opponent_token}
          return position[0] + 1 if board.valid_move?(position[0] + 1)
        end
      end 
      
      # If not close to winning, choose a random position
      position = rand(1..9)
      until board.valid_move?(position)
        position = rand(1..9)
      end
      position.to_s
    end 
  end
end 
      
 