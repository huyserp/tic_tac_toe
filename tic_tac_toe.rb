require 'pry'

class TicTacToe
    attr_accessor :board, :marker
    attr_reader :tie, :the_winner
   
    def initialize
        @gap = " "
        @choices = {"top left" => @gap, "top center" => @gap, "top right" => @gap,
                    "center left" => @gap, "center" => @gap, "center right" => @gap,
                    "bottom left" => @gap, "bottom center" => @gap, "bottom right" => @gap}
        
        @the_winner = false
        @tie = false
       
        @turn_counter = 1
        self.marker = "x"
    end

    def play
        show_board
        while game_over? == false
            puts "#{self.marker}: Where do you want to play?"
            position = gets.chomp.downcase
            place_marker(position)
        end
       puts @tie ? "It's a cat's game..." : "The game is over, '#{@the_winner}' takes the win!"
       clear_board
       puts "would you like to play again? yes / no"
       play_again = gets.chomp
       play_again.downcase == "yes" ? self.play : puts("Goodbye!")
    end

    private
    
    def place_marker(position)
        position = position.downcase
        occupied = "POSITION IS OCCUPIED"
        options = @choices.keys
        if options.include?(position) == false
            puts "Please pick a valid position, your options are:"
            options.each do |option|
                puts option
            end
        elsif @choices[position] != @gap
            puts occupied
        else
            @choices[position] = self.marker
            @turn_counter += 1
        end
        show_board
        change_turn
    end

    def check_winner
        horizontal_top = self.board[0].select { |pos| pos != "|" }.inject('+')
        horizontal_center = self.board[2].select { |pos| pos != "|" }.inject('+')
        horizontal_bottom = self.board[4].select { |pos| pos != "|" }.inject('+')

        vertical_left = @choices["top left"] + @choices["center left"] + @choices["bottom left"]
        vertical_center = @choices["top center"] + @choices["center"] + @choices["bottom center"]
        vertical_right = @choices["top right"] + @choices["center right"] + @choices["bottom right"]

        diagonal_decending = @choices["top left"] + @choices["center"] + @choices["bottom right"]
        diagonal_ascending = @choices["bottom left"] + @choices["center"] + @choices["top right"]

        winning_options = [horizontal_top, horizontal_center, horizontal_bottom, vertical_left, 
                           vertical_center, vertical_right, diagonal_ascending, diagonal_decending]

        combo = winning_options.select { |option| option.eql?("xxx") || option.eql?("ooo") }.pop
    
        @the_winner = combo[0] if combo
    end

    def check_cats_game
        empty_squares = 0
        @board.each do |row|
            row.each { |position| empty_squares += 1 if position == " " }
        end
        @tie = true if empty_squares == 0 && @the_winner == false
    end

    def game_over?
        check_winner
        check_cats_game
        @the_winner || @tie ? true : false
    end
    

    def change_turn
        @turn_counter.odd? ? self.marker = "x" : self.marker = "o"
    end

    def show_board
        self.board = [
            [@choices["top left"], "|", @choices["top center"], "|", @choices["top right"]], 
            ["-","-","-","-","-"],
            [@choices["center left"], "|", @choices["center"], "|", @choices["center right"]], 
            ["-","-","-","-","-"],
            [@choices["bottom left"], "|", @choices["bottom center"], "|", @choices["bottom right"]]
        ]
        puts
        self.board.each do |row|
           puts row.each { |position| position }.join('')
        end
        puts
    end

    def clear_board
        initialize
    end
end

class Player
    attr_accessor :name, :wins, :marker
    attr_reader :position

    @@number_of_players = 0

    def initialize(name, marker)
        @@number_of_players += 1
        self.name = name
        @position = @@number_of_players
        @position.odd? ? self.marker = "x" : self.marker = "o"
        @wins = 0

        puts "Hello, #{name}. You will play as '#{marker}'."
    end
  
    def self.number_of_players
        @@number_of_players
    end
end

game = TicTacToe.new
game.play