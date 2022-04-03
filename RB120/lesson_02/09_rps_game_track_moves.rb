# frozen_string_literal: true

# This version, we are adding a function to create a
# record of which moves were made by each player. The
# moves will be stored in an array in a class called
# history.  Every user input will have a new option
# where the user can type in 'h' and the state of
# the history array will print out.

class History
  @@moves = []

  def self.moves(computer, human)
    if @@moves.empty?
      puts "No moves have been made yet!"
    else
      @@moves.each_with_index do |move, index|
        puts "Round #{index + 1}: #{computer} chose #{move[0]}, #{human} chose #{move[1]}"
      end
    end
  end

  def self.log_moves (computer_choice, player_choice)
    @@moves << [computer_choice, player_choice]
  end
end

# Object Class for the Player
class Player

  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def choose_move(move_choice)
    self.move = case move_choice
                when 'rock'
                  Rock.new(move_choice)
                when 'paper' 
                  Paper.new(move_choice)
                when 'scissors' 
                  Scissors.new(move_choice)
                when 'lizard' 
                  Lizard.new(move_choice)
                when 'spock'
                  Spock.new(move_choice)
                end
  end
end

# Object class for the Human subclass of Player
class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp.strip.capitalize
      break unless n.empty?

      puts 'Sorry, must enter a value.'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, lizard, scissors, or spock:'
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      if choice == 'h'
        display_history
        break
      end

      puts 'Sorry, invalid choice.'
    end
    choose_move(choice)
  end
end

# Object class for the Computer subclass of Player
class Computer < Player
  def set_name
    self.name = %w[R2D2 Hal Chappie].sample
  end

  def choose
    choose_move(Move::VALUES.sample)
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

  def to_s
    @value
  end
end

class Rock < Move
  def >(other) 
    other.scissors? || other.lizard?
  end

  def <(other) 
    other.paper? || other.spock?
  end
end

class Paper < Move
  def >(other) 
    other.rock? || other.spock?
  end

  def <(other) 
    other.scissors? || other.lizard?
  end
end

class Scissors < Move
  def >(other) 
    other.paper? || other.lizard?
  end

  def <(other) 
    other.rock? || other.spock?
  end
end

class Lizard < Move
  def >(other) 
    other.spock? || other.paper?
  end

  def <(other) 
    other.rock? || other.scissors?
  end
end

class Spock < Move
  def >(other) 
    other.rock? || other.scissors?
  end

  def <(other) 
    other.lizard? || other.paper?
  end
end



# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors #{human.name}!"
    puts "First player to reach 10/10 wins the round!"
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
      if answer == 'h'
        History.moves(computer.name, human.name)
        break
      end

      puts 'Sorry, must be y or n.'
    end

    answer == 'y'
  end

  def display_history
    History.moves(computer.name, human.name)
  end

  def display_menu
    puts "_____ [x] to exit _____ [h] to view history _____ [y/n] for 'yes/no' _____"
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
      display_menu
      human.choose
      computer.choose
      History.log_moves(computer.move, human.move)
      decide_winner
      display_moves
      display_winner
      display_score
      display_menu
      break unless play_again?
      reset_round if human.score == 10 || computer.score == 10
    end
    display_goodbye_message
  end
end

### Start the game ###
RPSGame.new.play
