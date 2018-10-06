module Hangman
  class Game
    attr_reader :player
    attr_reader :board

    def initialize(player, board = Board.new)
      @player = player
      @board = board
    end

    def play
      solicit_guess
    end

    def solicit_guess
      puts "#{@player.name}, please guess a letter"
      get_guess
    end

    def get_guess(guess = gets.chomp)
      if guess.length == 1
        @board.check_letter(guess)
      else
        puts "You can't guess that"
        solicit_guess
      end
    end
  end
end
