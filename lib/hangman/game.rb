require "yaml"

module Hangman
  class Game
    attr_reader :player
    attr_reader :board

    def initialize(player, board = Board.new)
      @player = player
      @board = board
      @body_parts = ['o', '|', '/', '\\', '/', '\\']
      @stick_figure = Array.new(6, ' ')
    end

    def play
      while !board.game_over
        menu
        stick_figure
        solicit_guess
        input = gets.chomp.downcase
        case input
        when "1"
          solicit_load
        when "2"
          solicit_save
        else
          board.check_letter(parse_input(input))
        end
      end
      board.game_over == :winner ? you_win : you_lose
    end

    def menu
      puts "\n"
      puts "Load Game: 1"
      puts "Save Game: 2"
    end

    def solicit_guess
      puts "Previous guesses: #{board.guesses.join(" - ")}\n" if board.guesses.length > 0
      puts "Please guess a letter"
    end

    def solicit_save
      puts "Would you like to save the game?(y/n)"
      save_game if gets.chomp == "y"
    end

    private

    def solicit_load
      puts "Whose game would you like to load?"
      load_game(gets.chomp)
    end

    def save_game
      yaml = YAML::dump(@board)
      game_file = File.open("lib/saved_games/#{@player.name}.yaml", "w")
      game_file.puts yaml
      game_file.close
      puts "Game saved"
    end

    def load_game(player_name)
      save_file = File.open("lib/saved_games/#{player_name}.yaml", "r")
      @board = YAML::load(save_file)
      play
    end

    def parse_input(input)
      case input
      when '1'
        load_game
        parse_input(gets.chomp)
      when '2'
        save_game
        parse_input(gets.chomp)
      else
        return input
      end
    end

    def stick_figure
      if board.miss_count > 0
        @stick_figure[board.miss_count - 1] = @body_parts[board.miss_count - 1]
      end
      puts "----  "
      puts "|  #{@stick_figure[0]}  "
      puts "| #{@stick_figure[2]}#{@stick_figure[1]}#{@stick_figure[3]} "
      puts "| #{@stick_figure[4]} #{@stick_figure[5]} "
      puts "|     "
      puts "======"
      puts "\n"
      puts board.reveal.join("")
    end

    def you_win
      menu
      stick_figure
      puts "You win!"
    end

    def you_lose
      menu
      stick_figure
      puts "You lose. The word was #{@board.word.upcase}."
    end
  end
end
