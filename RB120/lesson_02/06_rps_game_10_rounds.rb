# frozen_string_literal: true

# This version, we are adding in new features. We will
# start by exploring two options for introducing a 10
# point scoring system.  Should we use a new class?  Or
# implement a state into an existing class?

# State:  We could have the player class contain a 
# 'score' state that would increment each time that
# the player wins a round

# Class:  We could have a 'score' class that contains
# methods for displaying the score.

# Using the 'State' approach feels more appropriate as
# we are already using "display" methods defined within
# the RPSgame class to perform the actual display duties.
# It would be a bit strange to include those within a 
# dedicated 'score' class.  Plus simply including score
# as a state within player class allows us to easily set
# the score to zero as part of the player instantiation 
# process.

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
      puts 'Please choose rock, paper, or scissors:'
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
  VALUES = %w[rock paper scissors].freeze

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

  def >(other)
    (rock? && other.scissors?) ||
      (paper? && other.rock?) ||
      (scissors? && other.paper?)
    # case @value
    # when 'rock'
    #   other.scissors?
    # when 'paper'
    #   other.rock?
    # when 'scissors'
    #   other.paper?
    # end
  end

  def <(other)
    (rock? && other.paper?) ||
      (paper? && other.scissors?) ||
      (scissors? && other.rock?)
    # case @value
    # when 'rock'
    #   other.paper?
    # when 'paper'
    #   other.scissors?
    # when 'scissors'
    #   other.rock?
    # end
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
    elsif human.move < computer.move
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
    human.score = 0
    computer.score = 0
    puts "Let's start the next round..."
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
