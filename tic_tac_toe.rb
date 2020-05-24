class Game < Array
    attr_accessor :board
    attr_reader :x, :o

    def initialize
        self.board = [
            [" ", "|", " ", "|", " "], 
            ["-","-","-","-","-"],
            [" ", "|", " ", "|", " "], 
            ["-","-","-","-","-"],
            [" ", "|", " ", "|", " "]
                ]
        @x = "x"
        @o = "o"
        @turn_counter = 1
        
        show_board
    end

    def place_marker(position)
        position = position.downcase
        option_grid = ["top left", "top center", "top right", 
            "center left", "center", "center right", "bottom left", 
            "bottom center", "bottom right"]

        if option_grid.include?(position) == false 
            puts
            puts "Please pick a valid position, your options are:"
            puts
            option_grid.each do |option|
               puts option
            end
            puts
        else
            case position
            when "top left"
                top_left
            when "top center"
                top_center
            when "top right"
                top_right
            when "center left"
                center_left
            when "center"
                center
            when "center right"
                center_right
            when "bottom left"
                bottom_left
            when "bottom center"
                bottom_center
            when "bottom right"
                bottom_right
                
            end
        end
    end

    private

    def top_left
        if self.board[0][0] != " "
            puts "POSITION IS OCCUPIED"
        else
            @turn_counter.odd? ? self.board[0][0] = "x" : self.board[0][0] = "o"
            @turn_counter += 1
        end
    
        show_board
    end

    def top_center
        if self.board[0][2] != " "
            puts"POSITION IS OCCUPIED"
        else
            @turn_counter.odd? ? self.board[0][2] = "x" : self.board[0][2] = "o"
            @turn_counter += 1
        end
        show_board
    end

    def top_right
        if self.board[0][4] != " "
            puts "POSITION IS OCCUPIED"
        else
            @turn_counter.odd? ? self.board[0][4] = "x" : self.board[0][4] = "o"
            @turn_counter += 1
        end
        
        show_board
    end

    def center_left
        if self.board[2][0] != " "
            puts "POSITION IS OCCUPIED"
        else
            @turn_counter.odd? ? self.board[2][0] = "x" : self.board[2][0] = "o"
            @turn_counter += 1
        end
        show_board
    end

    def center
        if self.board[2][2] != " "
           puts "POSITION IS OCCUPIED"
        else
            @turn_counter.odd? ? self.board[2][2] = "x" : self.board[2][2] = "o"
            @turn_counter += 1
        end
        show_board
    end

    def center_right
        if self.board[2][4] != " "
           puts "POSITION IS OCCUPIED"
        else
            @turn_counter.odd? ? self.board[2][4] = "x" : self.board[2][4] = "o"
            @turn_counter += 1
        end
        show_board
    end

    def bottom_left
        if self.board[4][0] != " "
           puts "POSITION IS OCCUPIED"
        else
            @turn_counter.odd? ? self.board[4][0] = "x" : self.board[4][0] = "o"
            @turn_counter += 1
        end
        show_board
    end

    def bottom_center
        if self.board[4][2] != " "
            puts "POSITION IS OCCUPIED"
        else
            @turn_counter.odd? ? self.board[4][2] = "x" : self.board[4][2] = "o"
            @turn_counter += 1
        end
        show_board
    end
    
    def bottom_right
        if self.board[4][4] != " "
            puts "POSITION IS OCCUPIED"
        else
            @turn_counter.odd? ? self.board[4][4] = "x" : self.board[4][4] = "o"
            @turn_counter += 1
        end
        show_board
    end

    def show_board
        puts
        @board.each do |row|
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