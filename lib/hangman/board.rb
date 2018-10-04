module Hangman
  class Board
    # hit?, game_over, winner?, miss_count, word_display
    attr_reader :word
    attr_reader :miss_count
    attr_reader :reveal

    def initialize(word = "")
      @miss_count = 0
      @word = word
      @reveal = Array.new(@word.length, "_")
    end

    def check_letter(letter)
      @word.include?(letter) ? hit(letter) : @miss_count += 1
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
  end
end
