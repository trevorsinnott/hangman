require_relative "../lib/hangman.rb"

def finish_game
  puts "Would you like to play again? (y/n)"
  choice = gets.chomp.downcase
  if choice == "n"
    false
  elsif choice != "y"
    finish_game
  else
    true
  end
end

puts "Welcome to Hangman, what's your name?"
player = Hangman::Player.new(gets.chomp)
new_game = true
while new_game
  Hangman::Game.new(player).play
  new_game = finish_game
end
