module Hangman
  class SecretWord
    attr_reader :word
    def initialize(word = random_word)
      @word = word.downcase
    end

    private

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
