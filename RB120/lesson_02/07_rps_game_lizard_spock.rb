# frozen_string_literal: true

# This version, we are adding in new features. We will
# now add in additional move options (lizard and spock).

# Adding in new options feels pretty straightfoward, we 
# will simply expand the accepted options as well as the
# win logic in the '<' '>' methods from the Move class.

# Object Class for the Player
class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

# Object class for the Human subclass of Player
class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?

      puts 'Sorry, must enter a value.'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, lizard, scissors, or spock:'
      choice = gets.chomp
      break if Move::VALUES.include? choice

      puts 'Sorry, invalid choice.'
    end
    self.move = Move.new(choice)
  end
end

# Object class for the Computer subclass of Player
class Computer < Player
  def set_name
    self.name = %w[R2D2 Hal Chappie].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Object class for chosen Moves
class Move
  VALUES = %w[rock paper scissors lizard spock].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other)
    (rock? && other.scissors? || rock? && other.lizard?) ||
      (paper? && other.rock? || paper? && other.spock?) ||
      (scissors? && other.paper? || scissors? && other.lizard?) ||
      (spock? && other.rock? || spock? && other.scissors?) ||
      (lizard? && other.spock? || lizard? && other.paper?)
  end

  def <(other)
    (rock? && other.paper? || rock? && other.spock?) ||
      (paper? && other.scissors? || paper? && other.lizard?) ||
      (scissors? && other.rock? || scissors? && other.spock?) ||
      (spock? && other.lizard? || spock? && other.paper?) ||
      (lizard? && other.rock? || lizard? && other.scissors?)
  end

  def to_s
    @value
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :winner

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
    puts 'First player to reach 10/10 wins the round!'
  end

  def display_goodbye_message
    puts 'Thank you for playing!'
  end

  def decide_winner
    human.score += 1 if human.move > computer.move
    computer.score += 1 if human.move < computer.move
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name}'s score is #{human.score}/10"
    puts "#{computer.name}'s score is #{computer.score}/10"
    if human.score == 10 
      puts "'><*><*'*><*> #{human.name} wins the round! <*><*'*><*><'"
    elsif computer.score == 10
      puts "'><*><*'*><*> #{computer.name} wins the round! <*><*'*><*><'"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp
      break if %w[y n].include? answer.downcase

      puts 'Sorry, must be y or n.'
    end

    answer == 'y'
  end

  def reset_round
    puts "Let's start the next round..."
    human.score = 0
    computer.score = 0
  end

  # Game Orchestration Engine
  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      decide_winner
      display_moves
      display_winner
      display_score
      break unless play_again?
      reset_round if human.score == 10 || computer.score == 10
    end
    display_goodbye_message
  end
end

### Start the game ###
RPSGame.new.play
