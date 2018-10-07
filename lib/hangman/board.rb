module Hangman
  class Board
    # hit?, game_over, winner?, miss_count, word_display
    attr_reader :word
    attr_reader :miss_count
    attr_reader :reveal
    attr_reader :guesses

    def initialize(word = random_word)
      @miss_count = 0
      @word = word
      @reveal = Array.new(@word.length, "_")
      @guesses = Array.new
    end

    def check_letter(letter)
      if @guesses.include?(letter)
        @miss_count += 1
      elsif @word.include?(letter)
        hit(letter)
        @guesses << letter
      else
        @miss_count += 1
        @guesses << letter
      end
    end

    def game_over
      return :loser if loser?
      return :winner if winner?
      false
    end

    private

    def hit(guess)
      @word.split("").each_with_index { |letter, i| @reveal[i] = guess if @word[i] == guess }
    end

    def loser?
      @miss_count < 6 ? false : true
    end

    def winner?
      @reveal.join("") == @word ? true : false
    end

    def random_word
      selection = ""
      while selection == ""
        temporary = File.readlines("./lib/5desk.txt").sample.strip
        selection = temporary if length_ok?(temporary)
      end
      selection
    end

    def length_ok?(check)
      if (check.length > 4) && (check.length < 13)
        return true
      else
        return false
      end
    end
  end
end
