require 'pry'
class Game
    #extend Players::Human
    attr_accessor :board, :player_1, :player_2

    def initialize(player1 = Players::Human.new("X") , player2 = Players::Human.new("O") , game_board = Board.new)
         @player_1 = player1
         @player_2 = player2
         @board = game_board
    end

    WIN_COMBINATIONS =[
        [ 0, 1, 2],
        [ 3, 4, 5],
        [ 6, 7, 8],
        [ 0, 4, 8],
        [ 0, 3, 6],
        [ 2, 4, 6],
        [ 1, 4, 7],
        [ 2, 5, 8]
    ]

    def current_player
        board.turn_count % 2 == 0 ? player_1: player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |winner|
            (board.cells[winner[0]] == "X" && board.cells[winner[1]] == "X" && board.cells[winner[2]] == "X") ||
            (board.cells[winner[0]] == "O" && board.cells[winner[1]] == "O" && board.cells[winner[2]] == "O")          
        end
    end

    def draw?
        (board.full? && !won?) ? true : false 
    end

    def over?
        draw? || won? ? true: false 
    end

    def winner
       won? ? board.cells[won?[0]]: nil 
    end

    def turn
        move = current_player.move(board)
        @board.valid_move?(move) ? move : current_player.move(board)
        @board.update(move, current_player)
    end

    def play 
        while !over?
            turn 
            board.display
        end
        draw? ? (puts "Cat's Game!") : (puts "Congratulations #{winner}!")
    end

    def self.start
        puts "Hello, welcome to tic-tac-toe"
        puts "How many player? (0-2): "
        players = gets.chomp
        player1 = ""
        player2 = ""
        if players.to_i == 1
            puts "Who should go first and be X? (Computer or Human) "
            player1 = gets.chomp
            player2 = player1 == "Human" ? "Computer" : "Human"
        elsif players.to_i == 0
            player1 = "Computer"
            player2 = "Computer"
        else
            player1 = "Human"
            player2 = "Human"
        end
        new_game = nil 
        if player1 == "Computer" && player2 == "Computer"
            new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        elsif player1 =="Computer" && player2 == "Human"
            new_game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
        elsif player1 == "Human" && player2 =="Computer"
            new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        else
            new_game = Game.new
        end
        new_game.play 


    end



end
