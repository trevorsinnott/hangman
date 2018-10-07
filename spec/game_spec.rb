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
        game = Game.new(Player.new("Someone"), Board.new("aa"))
        allow_any_instance_of(Game).to receive_messages(gets: 'a')
        expect(game.play).to eq :win
      end

      it "returns :lose if you loose" do
        game = Game.new(Player.new("Someone"), Board.new("b"))
        allow_any_instance_of(Game).to receive_messages(gets: 'a')
        expect(game.play).to eq :lose
      end
    end
  end
end
