require 'pry'

class Game < Array
    attr_accessor :board, :marker, :top_left, :top_center, :top_right, :center_left, :center,
                  :center_right, :bottom_left, :bottom_center, :bottom_right
    attr_reader :x, :o
    
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
        
        @x = "x"
        @o = "o"
        @turn_counter = 2
        self.marker = self.x
        
        show_board
    end

    def place_marker(position)
        position = position.downcase
        option_grid = ["top left", "top center", "top right", 
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
            option_grid.each do |option|
               puts option
            end
        end
            show_board
            change_turn
    end


    def game_over?
        horizontal = [
                    [@board[0][0], @board[0][2], @board[0][4]], 
                    [@board[2][0], @board[2][2], @board[2][4]], 
                    [@board[4][0], @board[4][2], @board[4][4]]
                    ]           
        vertical = [
                    [@board[0][0], @board[2][0], @board[4][0]], 
                    [@board[0][2], @board[2][2], @board[4][2]], 
                    [@board[0][4], @board[2][4], @board[4][4]]
                    ]
        diagonal = [[@board[0][0], @board[2][2], @board[4][4]], 
                    [@board[4][0], @board[2][2], @board[0][4]]
                    ]

        if (horizontal[0].uniq.size <= 1 && horizontal[0].uniq != [" "])|| 
           (horizontal[1].uniq.size <= 1 && horizontal[1].uniq != [" "])|| 
           (horizontal[2].uniq.size <= 1 && horizontal[2].uniq != [" "])
            true
        elsif (vertical[0].uniq.size <= 1 && vertical[0].uniq != [" "])|| 
              (vertical[1].uniq.size <= 1 && vertical[1].uniq != [" "])|| 
              (vertical[2].uniq.size <= 1 && vertical[2].uniq != [" "])
            true
        elsif (diagonal[0].uniq.size <= 1 && diagonal[0].uniq != [" "])|| 
              (diagonal[1].uniq.size <= 1 && diagonal[1].uniq != [" "])
            true
        elsif (horizontal[0].uniq.size > 1 && horizontal[1].uniq.size > 1 && horizontal[2].uniq.size > 1) && horizontal.include?(" ") == false
            
            true
        else
            false
        end
    end

    private

    def change_turn
        @turn_counter.odd? ? self.marker = self.x : self.marker = self.o
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

# game = Game.new
# game.place_marker("top left")
# game.place_marker("center")