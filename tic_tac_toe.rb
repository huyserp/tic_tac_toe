class Board < Array
    attr_accessor :board

    def initialize
        @board = [
            [" ", "|", " ", "|", " "], 
            ["-","-","-","-","-"],
            [" ", "|", " ", "|", " "], 
            ["-","-","-","-","-"],
            [" ", "|", " ", "|", " "]
                ]
        
        show_board
    end

    def center_center(marker)


    
    private

    def show_board
        puts
        @board.each do |row|
           puts row.each { |position| position }.join('')
        end
        puts
    end

end

class Player
    attr_accessor :name, :marker
    attr_reader :position

    @@number_of_players

    def initialize(name, marker)
end

