require 'pry'
class Board
    attr_reader :cells

    def initialize
       @cells = []
        reset!
    end


    def reset!
        cells.clear 
        @cells = Array.new(9, " ")
    end

    def cells=(token)
        @cells = token 
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(cell_value)
        @cells[(cell_value.to_i-1)]
    end

    def full?
        (!@cells.include?(" "))? true: false     
    end

    def turn_count
        @cells.select{|position| position == "X" || position == "O"}.count 
    end

    def taken?(cell_value)
        position(cell_value) != " " ? true: false 
    end

    def valid_move?(cell_num)
        (cell_num.to_i > 0 && cell_num.to_i < 10)&& !taken?(cell_num) ? true: false 
    end

    def update(cell_choice, player)
        if !taken?(cell_choice) && valid_move?(cell_choice)
            @cells[cell_choice.to_i-1] = player.token
        end
    end
end