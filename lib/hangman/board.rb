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
      @word.include?(letter) ? hit : @miss_count += 1
    end

    def game_over
      if loser?
        return :loser
      elsif winner?
        return :winner
      else
        false
      end
    end

    private

    def hit
      return "hit"
    end

    def loser?
      @miss_count < 6 ? false : true
    end

    def winner?
      @reveal.join("") == @word ? true : false
    end
  end
end
