# frozen_string_literal: true

require 'io/console'

# Final version - rubocop appeased and some improvements made to gameplay.
# If I were to refactor it further, I would structure the individual
# rounds and whole game as two discrete loops/methods.

# User Interface Module
module Flow
  def self.press_any_key
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
    @moves_list = []
  end

  def print_moves(human)
    if @moves_list.empty?
      puts 'No moves have been made yet!'
    else
      @moves_list.each_with_index do |move, index|
        puts "Round #{index + 1}: #{move[2]} chose #{move[0]}, "\
             "#{human} chose #{move[1]}"
      end
    end
  end

  def log_moves(computer_choice, player_choice, bot)
    @moves_list << [computer_choice, player_choice, bot]
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
      puts 'Please choose [r]ock, [p]aper, [l]izard, [s]cissors, or spoc[k]:'
      choice = gets.chomp.downcase
      choice = move_menu(choice)
      break if Move::VALUES.include? choice
      puts 'Sorry, invalid choice.'
    end
    choose_move(choice)
  end

  def move_menu(user_input)
    case user_input
    when 'r' then 'rock'
    when 'p' then 'paper'
    when 'l' then 'lizard'
    when 's' then 'scissors'
    when 'k' then 'spock'
    else user_input
    end
  end
end

# Object class for the Computer subclass of Player
class Computer < Player
  attr_accessor :bot

  def set_name
    @bot = choose_computer_player
    @name = @bot.name
  end

  def choose_computer_player
    system 'clear'
    opponent = ''
    loop do
      puts 'Who do you want to play? [1]R2D2 [2]Hal [3]Chappie [4]C3P0'
      opponent = gets.chomp
      break if %w(1 2 3 4).include? opponent

      puts 'Sorry, must choose 1, 2, 3, or 4.'
    end

    select_opponent(opponent)
  end

  def select_opponent(number)
    case number
    when '1' then R2D2.new
    when '2' then Hal.new
    when '3' then Chappie.new
    when '4' then C3P0.new
    end
  end

  def choose(optional_argument = nil)
    @bot.choose(optional_argument)
  end
end

# R2D2 Computer class
class R2D2 < Computer
  def set_name
    @name = 'R2D2'
  end

  def choose(*)
    choose_move(Move::VALUES.sample)
  end

  def speak(*)
    puts "R2D2 says: \'%Beep%*Boop*&Biip&*Boop*\'"
    sleep 1
  end
end

# Hal Computer class
class Hal < Computer
  def set_name
    @name = 'Hal'
  end

  def choose(user_move)
    hal_move = case user_move.to_s
               when 'rock' then %w(paper spock).sample
               when 'paper' then %w(scissors lizard).sample
               when 'scissors' then %w(rock spock).sample
               when 'lizard' then %w(rock scissors).sample
               when 'spock' then %w(lizard paper).sample
               end

    choose_move(hal_move)
  end

  def speak(user)
    puts "Hal says: \"I'm sorry #{user}, I can't let you do that.\""
    sleep 1
  end
end

# R2D2 Computer class
class C3P0 < Computer
  attr_accessor :previous_move

  def set_name
    @name = 'C3P0'
  end

  def choose(user_move)
    if @previous_move
      choose_move(previous_move)
      @previous_move = user_move.to_s
    else
      @previous_move = user_move.to_s
      choose_move(Move::VALUES.sample)
    end
  end

  def speak(*)
    puts "C3P0 says: \'Oh dear...\'"
    sleep 1
  end
end

# Chappie Computer class
class Chappie < Computer
  def set_name
    @name = 'Chappie'
  end

  def choose(*)
    choose_move('lizard')
  end

  def speak(*)
    puts "Chappie says: \'I like lizards!\'"
    sleep 1
  end
end

# Object class for chosen Moves
class Move
  VALUES = %w(rock paper scissors lizard spock).freeze

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
  include Flow
  attr_accessor :human, :computer, :history

  def initialize
    system 'clear'
    @human = Human.new
    @history = History.new
    @computer = Computer.new
  end

  # Game Orchestration Engine
  def play
    display_welcome_message
    loop do
      main_game_loop
      break unless play_again?
      reset_round
    end
    display_goodbye_message
  end

  # Welcome/Goodbye messages
  def display_welcome_message
    Flow.pause
    puts "Welcome to Rock, Paper, Scissors #{human.name}!"
    puts 'First player to reach 3/3 wins the round!'
    Flow.press_any_key
  end

  def display_goodbye_message
    puts 'Thank you for playing!'
  end

  # main_game_loop and subroutines
  def main_game_loop
    loop do
      take_turns
      display_winner
      break if human.score == 3 || computer.score == 3
      break unless continue?
    end
  end

  # take_turns and subroutines
  def take_turns
    Flow.pause
    human.choose
    Flow.pause
    computer_choose
    history.log_moves(computer.bot.move, human.move, computer.bot.name)
  end

  def computer_choose
    if computer.name == 'Hal' || computer.name == 'C3P0'
      computer.choose(human.move)
    else
      computer.choose
    end
  end

  # display_winner and subroutines
  def display_winner
    decide_winner
    display_human_move
    display_computer_move
    puts winner_message
    Flow.press_any_key
    Flow.pause
    display_score
    display_round_winner
  end

  def decide_winner
    human.score += 1 if human.move > computer.bot.move
    computer.score += 1 if human.move < computer.bot.move
  end

  def display_human_move
    puts "You chose #{human.move}."
    sleep 1
  end

  def display_computer_move
    puts "#{computer.name} chose #{computer.bot.move}."
    sleep 1
    computer.bot.speak(human.name)
  end

  def winner_message
    if human.move > computer.bot.move
      "#{human.name} won!"
    elsif human.move < computer.bot.move
      "#{computer.name} won!"
    else
      "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name}'s score is #{human.score}/3"
    puts "#{computer.name}'s score is #{computer.score}/3"
  end

  def display_round_winner
    winner = nil
    winner = human.name if human.score == 3
    winner = computer.name if computer.score == 3
    puts "'><*><*'*><*> #{winner} wins the round! <*><*'*><*><'" if winner
  end

  # end of game methods
  def play_again?
    loop do
      puts 'Would you like to play another round? (y/n)'\
           ' - Press [h] to view history'
      case gets.chomp
      when 'h' then history.print_moves(human.name)
      when 'n' then return false
      when 'y' then return true
      else puts 'Sorry, must be y or n.'
      end
    end
  end

  def continue?
    loop do
      puts 'Would you like to continue? (y/n) - Press [h] to view history'
      case gets.chomp
      when 'h' then history.print_moves(human.name)
      when 'y' then return true
      when 'n' then return false
      else puts 'Sorry, must be y or n.'
      end
    end
  end

  def reset_round
    puts "Let's start the next round..."
    sleep 2
    Flow.pause
    human.score = 0
    @computer = Computer.new
  end
end

### Start the game ###
RPSGame.new.play
