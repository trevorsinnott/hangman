# Hangman

Classes:
 - Player
 - Word
  - Picked by player
  - Else randomly picked
 - Guesses
  - Correct
  - Incorrect
 - Board
  - Hangman
  - Revealed letters
  - Hidden letters
  - Guessed letters
 - Game

Hangman can be played by one or more humans on the command line. The game board
shows a hangman, any guessed letters and a spot for each letter in the word.
The hangman is drawn one part at a time when the player makes an incorrect
guess. If the player correctly guesses a letter in the word each instance of
that letter is revealed. They player wins by revealing the entire word before
the entire hangman is drawn. If the entire hangman is drawn before all of the
letters are exposed, the player looses.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hangman'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hangman

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hangman.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
