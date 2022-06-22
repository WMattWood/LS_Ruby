class GuessingGame
  def initialize
  end

  def play 
    @number = (1..100).to_a.sample
    @turns = 7
    @answer = nil
    run_game
  end

  def run_game
    system('clear')
    loop do
      if turns == 0
        puts "You have no more guesses. You lost!"
        break 
      end

      puts "You have #{turns} turns remaining."
      guess_number
      
      if answer == number
        player_win
        break
      elsif answer < number
        puts "Your guess is too low."
      else
        puts "Your guess is too high."
      end

      sleep 1
      self.turns -= 1
    end
  end

  attr_accessor :turns, :answer
  attr_reader :number

  def guess_number
    loop do
      puts "Enter a number between 1 and 100:"
      self.answer = gets.chomp.to_i
      break if (1..100).include?(answer)
      puts "Invalid guess."
    end
  end

  def player_win
    puts "That's the number!"
    sleep 1
    puts "You win!"
  end
end


game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!