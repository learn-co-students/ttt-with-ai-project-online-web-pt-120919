module Players
    class Computer < Player

        def move(board)
            move = rand(1..9)
            while !board.valid_move?(move.to_s)
                move = rand(1..9)
            end
            move.to_s 
        end

    end

end