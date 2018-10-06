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
  end
end
