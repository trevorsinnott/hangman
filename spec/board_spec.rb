require "spec_helper"

module Hangman
  RSpec.describe Board do
    context "#initialize" do
      it "initializes @miss_count to 0" do
        board = Board.new
        expect(board.miss_count).to eq 0
      end
    end
  end
end
