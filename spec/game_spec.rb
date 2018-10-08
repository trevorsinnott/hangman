require "spec_helper"
module Hangman
  RSpec.describe Game do
    context "#initialize" do
      it "initializes @player to provided object" do
        game = Game.new("John")
        expect(game.player).to eq "John"
      end

      it "initializes @board to a new Board object if no argument provided" do
        game = Game.new("John")
        expect(game.board.is_a?(Board)).to eq true
      end
    end

    context "#play" do
      it "returns :win if you win" do
        board = Board.new
        game = Game.new(Player.new("Someone"), board)
        allow(board).to receive_messages(game_over: :winner)
        expect(game.play).to eq :win
      end

      it "returns :lose if you lose" do
        board = Board.new
        game = Game.new(Player.new("Someone"), board)
        allow(board).to receive_messages(game_over: :loser)
        expect(game.play).to eq :lose
      end
    end
  end
end
