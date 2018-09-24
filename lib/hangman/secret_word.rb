module Hangman
  class SecretWord
    attr_reader :word
    def initialize(word = random_word)
      @word = word
    end

    def random_word
      File.readlines("./lib/5desk.txt").sample
    end
  end
end
