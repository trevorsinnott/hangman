require "spec_helper"

module Hangman
  RSpec.describe SecretWord do
    context "#initialize" do
      it "takes custom secret word as string" do
        word = "some word"
        secret_word = SecretWord.new(word)
        expect(secret_word.word).to eq "some word"
      end

      it "assigns random word when no custom input is given" do
        secret_word = SecretWord.new
        expect(secret_word.word).to eq "some word"
      end
    end
  end
end
