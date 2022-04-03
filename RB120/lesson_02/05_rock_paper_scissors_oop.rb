# frozen_string_literal: true

# This version contains all Rubocop formatting updates.
# Key terms include methods having too many lines, adding
# empty lines after guard classes, freezing mutable constant
# objects, specific rules for redifining </> operators,
# assignment branch condition size limits, class documentation.

# Object Class for the Player
class Player
  attr_accessor :move, :name

  def initialize
    set_name
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
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    puts 'Thank you for playing!'
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      "#{human.name} won!"
    elsif human.move < computer.move
      "#{computer.name} won!"
    else
      "It's a tie!"
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

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      puts display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

### Start the game ###
RPSGame.new.play
