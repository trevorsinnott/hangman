module Hangman
  class SecretWord
    attr_reader :word
    def initialize(word = random_word)
      @word = word
    end

    def random_word
      "some word"
    end
  end
end
