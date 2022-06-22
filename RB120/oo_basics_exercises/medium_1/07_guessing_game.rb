class GuessingGame
  def initialize(lower_bound, upper_bound)
    @lower_bound = lower_bound
    @upper_bound = upper_bound
    @number_range = (lower_bound..upper_bound)
  end

  def play 
    @turns = Math.log2((upper_bound - lower_bound)).to_i + 1
    @number = number_range.to_a.sample
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

  attr_accessor :turns, :answer, :lower_bound, :upper_bound
  attr_reader :number, :number_range

  def guess_number
    loop do
      puts "Enter a number between #{lower_bound} and #{upper_bound}:"
      self.answer = gets.chomp.to_i
      break if number_range.include?(answer)
      puts "Invalid guess."
    end
  end

  def player_win
    puts "That's the number!"
    sleep 1
    puts "You win!"
  end
end

game = GuessingGame.new(1, 1500)
game.play
game.play