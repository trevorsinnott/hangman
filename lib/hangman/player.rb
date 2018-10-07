module Hangman
  class Player
    attr_reader :name
    def initialize(input)
      @name = input
    end
  end
end
