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
      :win
    end

    def you_lose
      :lose
    end
  end
end
