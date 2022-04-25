require 'pry'

class Board
  INITIAL_MARKER = ' '
  # attr_reader :squares
  
  def initialize
    @squares = {} 
    (1..9).each {|key| @squares[key] = Square.new(INITIAL_MARKER)}
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select {|key| @squares[key].unmarked?}
  end
end

class Square
  attr_accessor :marker

  def initialize(marker)
    @marker = marker
    # maybe a status to keep track of each square's mark
  end

  def to_s
    @marker 
  end

  def unmarked?
    marker == Board::INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

# Orchestration Engine
class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts ""
    puts "     |     |     "
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}  "
    puts "     |     |     "
    puts ""
  end

  def human_moves
    puts "Choose a square [#{board.unmarked_keys.join(', ')}]"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry that is not a valid choice."
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def play
    welcome_message
    loop do # begin_game
      display_board
      loop do # begin_round
        human_moves
        # break if someone_won? || board_full?

        computer_moves
        # break if someone_won? || board_full?
        
        display_board
      end
    #display_result
    break #unless play_again?
    end

    goodbye_message
  end
end

game = TTTGame.new
game.play
