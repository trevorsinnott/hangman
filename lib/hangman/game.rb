module Hangman
  class Game
    attr_reader :player
    attr_reader :board

    def initialize(player, board = Board.new)
      @player = player
      @board = board
    end

    def play
      while !board.game_over
        solicit_guess
        board.check_letter(gets.chomp.downcase)
        puts board.guesses.join(" - ")
      end
      board.game_over == :winner ? you_win : you_lose
    end

    def solicit_guess
      puts "#{@player.name} has #{6 - board.miss_count} guesses left"
      puts board.reveal.join("")
      puts "Please guess a letter"
    end

    private

    def stick_figure
      "----  "
      "|  o  "
      "| /|\ "
      "| / \ "
      "|     "
      "======"
    end

    def you_win
      puts "You win!"
    end

    def you_lose
      puts "You lose."
    end
  end
end
