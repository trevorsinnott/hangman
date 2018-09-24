require "spec_helper"

module Hangman
  RSpec.describe SecretWord do
    context "#initialize" do
      it "takes custom secret word as string" do
        word = "some word"
        secret_word = SecretWord.new(word)
        expect(secret_word.word).to eq "some word"
      end
    end

    context "#random_word" do
      it "assigns a string to the @word variable if no string is initially given" do
        secret_word = SecretWord.new
        word_string = secret_word.word.to_s
        expect(secret_word.word).to eq word_string
      end
    end
  end
end
