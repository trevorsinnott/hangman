require "spec_helper"

module Hangman
  RSpec.describe Player do
    context "#initialize" do

      it "raises an exception when initialized with {}" do
        expect { Player.new({} ).to raise_error}
      end

      it "does not raise an error when initialized with a valid input hash" do
        input = { name: "Someone" }
        expect { Player.new(input) }.to_not raise_error
      end
    end

    context "#name" do
      it "returns the players name" do
        input = { name: "Someone" }
        player = Player.new(input)
        expect(player.name).to eq "Someone"
      end
    end
  end
end
