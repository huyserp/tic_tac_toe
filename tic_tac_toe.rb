require 'pry'

class TicTacToe
    attr_accessor :board, :marker, :top_left, :top_center, :top_right, :center_left, :center,
                  :center_right, :bottom_left, :bottom_center, :bottom_right
    attr_reader :tie, :the_winner
   
    
    def initialize
        self.top_left = " "
        self.top_center = " "
        self.top_right = " "
        self.center_left = " "
        self.center = " "
        self.center_right = " "
        self.bottom_left = " "
        self.bottom_center = " "
        self.bottom_right = " "
        
        @the_winner = nil
        @tie = nil
       
        @turn_counter = 1
        self.marker = "x"
    end

    def play
        self.show_board
        while self.game_over? == false
            puts "Where would you like to place your marker?"
            position = gets.chomp
            self.place_marker(position)
            self.game_over?
        end

       if @tie
            puts "It's a cat's game..."
       else
            puts "The game is over '#{@the_winner}' takes the win!"
       end

        self.clear_board

        puts "would you like to play again? yes / no"
        play_again = gets.chomp
        play_again.downcase == "yes" ? self.play : "Goodbye!"
    end


    def place_marker(position)
        position = position.downcase
        options = ["top left", "top center", "top right", 
                       "center left", "center", "center right", 
                       "bottom left", "bottom center", "bottom right"]

    
        if position == "top left"
                if self.top_left != " "
                    puts "POSITION IS OCCUPIED"
                else
                    marker = self.marker
                    self.top_left = marker
                    @turn_counter += 1
                end
        elsif position == "top center"
                if self.top_center != " "
                    puts "POSITION IS OCCUPIED"
                else
                    marker = self.marker
                    self.top_center = marker
                    @turn_counter += 1
                end
        elsif position ==  "top right"
                if self.top_right != " "
                    puts "POSITION IS OCCUPIED"
                else
                    marker = self.marker
                    self.top_right = marker
                    @turn_counter += 1
                end
        elsif position == "center left"
                if self.center_left != " "
                    puts "POSITION IS OCCUPIED"
                else
                    marker = self.marker
                    self.center_left = marker
                    @turn_counter += 1
                end
        elsif position == "center"
                if self.center != " "
                    puts "POSITION IS OCCUPIED"
                else
                    marker = self.marker
                    self.center = marker
                    @turn_counter += 1
                end
        elsif position == "center right"
                if self.center_right != " "
                    puts "POSITION IS OCCUPIED"
                else
                    marker = self.marker
                    self.center_right = marker
                    @turn_counter += 1
                end
        elsif position == "bottom left"
                if self.bottom_left != " "
                    puts "POSITION IS OCCUPIED"
                else
                    marker = self.marker
                    self.bottom_left = marker
                    @turn_counter += 1
                end
        elsif position == "bottom center"
                if self.bottom_center != " "
                    puts "POSITION IS OCCUPIED"
                else
                    marker = self.marker
                    self.bottom_center = marker
                    @turn_counter += 1
                end
        elsif position == "bottom right"
                if self.bottom_right != " "
                    puts "POSITION IS OCCUPIED"
                else
                    marker = self.marker
                    self.bottom_right = marker
                    @turn_counter += 1
                end
        else
            puts
            puts "Please pick a valid position, your options are:"
            puts
            options.each do |option|
               puts option
            end
        end
            show_board
            change_turn
    end

    def check_winner
        horizontal_top = self.top_left + self.top_center + self.top_right
        horizontal_center = self.center_left + self.center + self.center_right
        horizontal_bottom = self.bottom_left + self.bottom_center + self.bottom_right

        vertical_left = self.top_left + self.center_left + self.bottom_left
        vertical_center = self.top_center + self.center + self.bottom_center
        vertical_right = self.top_right + self.center_right + self.bottom_right

        diagonal_decending = self.top_left + self.center + self.bottom_right
        diagonal_ascending = self.bottom_left + self.center + self.top_right

        winning_options = [horizontal_top, horizontal_center, horizontal_bottom, 
                           vertical_left, vertical_center, vertical_right,
                           diagonal_ascending,diagonal_decending]

        combo = winning_options.select { |option| option.eql?("xxx") || option.eql?("ooo") }.pop
    
        @the_winner = combo[0] if combo
    end

    def check_cats_game
        empty_squares = 0
        @board.each do |row|
            row.each { |position| empty_squares += 1 if position == " " }
        end
        @tie = true if empty_squares == 0
    end

    def game_over?
        self.check_winner
        self.check_cats_game
        @the_winner || @tie ? true : false
    end
    

    def change_turn
        @turn_counter.odd? ? self.marker = "x" : self.marker = "o"
    end

    def show_board
        self.board = [
            [self.top_left, "|", self.top_center, "|", self.top_right], 
            ["-","-","-","-","-"],
            [self.center_left, "|", self.center, "|", self.center_right], 
            ["-","-","-","-","-"],
            [self.bottom_left, "|", self.bottom_center, "|", self.bottom_right]
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