require "spec_helper"

module Hangman
  RSpec.describe Board do
    context "#initialize" do
      it "initializes @miss_count to 0" do
        board = Board.new
        expect(board.miss_count).to eq 0
      end

      it "initializes @word to the given string" do
        board = Board.new("something")
        expect(board.word).to eq "something"
      end

      it "initializes @word to a random string when no argument given" do
        board = Board.new
        expect(board.word.is_a?(String)).to eq true
      end

      it "initializes @word to a random string that is > 4" do
        board = Board.new
        expect(board.word.length).to be > 4
      end

      it "initializes @word to a random string that is < 13" do
        board = Board.new
        expect(board.word.length).to be < 13
      end

      it "initializes @reveal to be an array with the same length as @word" do
        board = Board.new("abc")
        expect(board.reveal.length).to eq board.word.length
      end

      it "initializes @reveal as an array of underscores" do
        board = Board.new("abc")
        expect(board.reveal).to eq ["_", "_", "_"]
      end
    end

    context "#check_letter" do
      it "increases @miss_count by one if letter is not in @word" do
        board = Board.new("a")
        board.check_letter("b")
        expect(board.miss_count).to eq 1
      end

      it "adds letter to the @reveal array at the correct index if letter is in @word" do
        board = Board.new("abc")
        board.check_letter("b")
        expect(board.reveal).to eq ["_", "b", "_"]
      end

      it "adds guessed letter to the @guesses array" do
        board = Board.new
        board.check_letter("a")
        expect(board.guesses).to eq ["a"]
      end
    end

    context "#game_over" do
      it "returns false if @miss_count is less than 6 and @reveal is not complete" do
        board = Board.new("something")
        expect(board.game_over).to eq false
      end

      it "returns :winner if @reveal is complete" do
        board = Board.new("a")
        board.check_letter("a")
        expect(board.game_over).to eq :winner
      end

      it "returns :loser if @miss_count is 6 or greater" do
        board = Board.new("something")
        6.times do
          board.check_letter("z")
        end
        expect(board.game_over).to eq :loser
      end
    end
  end
end
