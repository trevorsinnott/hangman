require "yaml"

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
        puts "Previous guesses: #{board.guesses.join(" - ")}" if board.guesses.length > 0
        solicit_save
      end
      board.game_over == :winner ? you_win : you_lose
    end

    def solicit_guess
      puts "#{@player.name} has #{6 - board.miss_count} guesses left"
      puts board.reveal.join("")
      puts "Please guess a letter"
    end

    def solicit_save
      puts "Would you like to save the game?(y/n)"
      save_game if gets.chomp == "y"
    end

    def save_game
      yaml = YAML::dump(@board)
      game_file = File.open("lib/saved_games/saved.yaml", "w")
      game_file.puts yaml
    end

    private

    #def stick_figure
      #"----  "
      #"|  o  "
      #"| /|\ "
      #"| / \ "
      #"|     "
      #"======"
    #end

    def you_win
      puts "You win!"
    end

    def you_lose
      puts "You lose. The word was #{@board.word.upcase}."
    end
  end
end
