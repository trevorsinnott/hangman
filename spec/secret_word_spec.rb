require "spec_helper"

module Hangman
  RSpec.describe SecretWord do
    context "#initialize" do
      it "takes custom secret word as string" do
        word = "some word"
        secret_word = SecretWord.new(word)
        expect(secret_word.word).to eq "some word"
      end

      it "assigns a string to the @word variable if no string is initially given" do
        secret_word = SecretWord.new
        word_string = secret_word.word.to_s
        expect(secret_word.word).to eq word_string
      end

      it "randomly selects a word that is more than 4 characters" do
        secret_word = SecretWord.new
        expect(secret_word.word.length).to be > 4
      end

      it "randomly selects a word that is less than 13 characters" do
        secret_word = SecretWord.new
        expect(secret_word.word.length).to be < 13
      end

      it "converts custom string to lower-case" do
        secret_word = SecretWord.new("TEsT")
        expect(secret_word.word).to eq "test"
      end

      it "converts random string to lower-case if necessary" do
        secret_word = SecretWord.new
        lowercase_word = secret_word.word.downcase
        expect(secret_word.word).to eq lowercase_word
      end
    end
  end
end
