module Hangman
  class Board
    # hit?, game_over, winner?, miss_count, word_display
    attr_accessor :word
    attr_reader :miss_count

    def initialize
      @miss_count = 0
    end
  end
end
