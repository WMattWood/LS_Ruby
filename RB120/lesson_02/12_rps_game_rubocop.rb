# frozen_string_literal: true

require 'io/console'

# This version, I am trying to appease rubocop

# User Interface Module
module UI
  def self.continue
    puts 'Press any key to continue'
    STDIN.getch
  end

  def self.pause
    system 'clear'
    sleep 1
  end
end

# Class for the stored history of moves
class History
  def initialize
    @moves = []
  end

  def moves(computer, human)
    if @moves.empty?
      puts 'No moves have been made yet!'
    else
      @moves.each_with_index do |move, index|
        puts "Round #{index + 1}: #{computer} chose #{move[0]}, #{human} chose #{move[1]}"
      end
    end
  end

  def log_moves(computer_choice, player_choice)
    @moves << [computer_choice, player_choice]
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
                when 'rock' then Rock.new(move_choice)
                when 'paper' then Paper.new(move_choice)
                when 'scissors' then Scissors.new(move_choice)
                when 'lizard' then Lizard.new(move_choice)
                when 'spock' then Spock.new(move_choice)
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

      puts 'Sorry, invalid choice.'
    end
    choose_move(choice)
  end
end

# Object class for the Computer subclass of Player
class Computer < Player
  def set_name
    computer_player = %w[R2D2 Hal Chappie].sample
    self.name = case computer_player
                when 'R2D2' then R2D2.new
                when 'Hal' then Hal.new
                when 'Chappie' then Chappie.new
                end
  end

  def choose
    choose_move(Move::VALUES.sample)
  end
end

# R2D2 Computer class
class R2D2 < Computer
end

# Hal Computer class
class Hal < Computer
end

# Chappie Computer class
class Chappie < Computer
  def choose
    choose_move('lizard')
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

# Rock Move class
class Rock < Move
  def >(other)
    other.scissors? || other.lizard?
  end

  def <(other)
    other.paper? || other.spock?
  end
end

# Paper Move class
class Paper < Move
  def >(other)
    other.rock? || other.spock?
  end

  def <(other)
    other.scissors? || other.lizard?
  end
end

# Scissors Move class
class Scissors < Move
  def >(other)
    other.paper? || other.lizard?
  end

  def <(other)
    other.rock? || other.spock?
  end
end

# Lizard Move class
class Lizard < Move
  def >(other)
    other.spock? || other.paper?
  end

  def <(other)
    other.rock? || other.scissors?
  end
end

# Spock Move class
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
  include UI
  attr_accessor :human, :computer, :history

  def initialize
    system 'clear'
    @human = Human.new
    @computer = Computer.new
    @history = History.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors #{human.name}!"
    puts 'First player to reach 3/3 wins the round!'
  end

  def display_goodbye_message
    puts 'Thank you for playing!'
  end

  def display_moves
    puts "You chose #{human.move}."
    sleep 1
    puts "#{computer.name} chose #{computer.move}."
    sleep 1
  end

  def winner_message
    if human.move > computer.move
      "#{human.name} won!"
    elsif human.move < computer.move
      "#{computer.name} won!"
    else
      "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name}'s score is #{human.score}/3"
    puts "#{computer.name}'s score is #{computer.score}/3"
    # if human.score == 3
    #   puts "'><*><*'*><*> #{human.name} wins the round! <*><*'*><*><'"
    # elsif computer.score == 3
    #   puts "'><*><*'*><*> #{computer.name} wins the round! <*><*'*><*><'"
    # end
  end

  def display_round_winner
    winner = nil
    winner = human.name if human.score == 3
    winner = computer.name if computer.score == 3
    puts "'><*><*'*><*> #{winner} wins the round! <*><*'*><*><'" if winner
  end

  def play_again?
    loop do
      puts 'Would you like to play again? (y/n) - Press [h] to view history'
      case gets.chomp
      when 'h' then history.moves(computer.name, human.name)
      when 'y' then return true
      when 'n' then return false
      else puts 'Sorry, must be y or n.'
      end
    end
  end

  # Game Orchestration Engine
  def play
    UI.pause
    display_welcome_message
    UI.continue
    main_game_loop
    display_goodbye_message
  end

  def take_turns
    UI.pause
    human.choose
    UI.pause
    computer.choose
    history.log_moves(computer.move, human.move)
  end

  def decide_winner
    human.score += 1 if human.move > computer.move
    computer.score += 1 if human.move < computer.move
  end

  def display_winner
    display_moves
    puts winner_message
    UI.continue
    UI.pause
    display_score
    display_round_winner
  end

  def reset_round
    puts "Let's start the next round..."
    human.score = 0
    computer.score = 0
  end

  def main_game_loop
    loop do
      take_turns
      decide_winner
      display_winner
      break unless play_again?

      reset_round if human.score == 3 || computer.score == 3
    end
  end
end

### Start the game ###
RPSGame.new.play
