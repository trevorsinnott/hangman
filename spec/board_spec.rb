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

      it "intializes @word to empty string if no string given" do
        board = Board.new
        expect(board.word).to eq ""
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
    end

    context "#game_over" do
      it "returns false if @miss_count is less than 6 and @reveal is not complete" do
        board = Board.new("something")
        expect(board.game_over).to eq false
      end

      it "returns :winner if @reveal is complete" do
        board = Board.new("abc")
        allow(board).to receive_messages(reveal: ["a", "b", "c"])
        expect(board.game_over).to eq :winner
      end
    end
  end
end
