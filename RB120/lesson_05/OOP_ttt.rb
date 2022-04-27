class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |     "
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts "     |     |     "
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def formatted_unmarked_keys(delimiter)
    if unmarked_keys.size > 2
      unmarked_keys[0..-2].join(delimiter) + " or #{unmarked_keys[-1]}"
    elsif unmarked_keys.size > 1
      "#{unmarked_keys[0]} or #{unmarked_keys[1]}"
    else
      unmarked_keys[0].to_s
    end
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def match?(line, marker)
    line.all? { |num| @squares[num].marker == marker }
  end

  def winning_marker
    WINNING_LINES.each do |line|
      return TTTGame::HUMAN_MARKER if match?(line, TTTGame::HUMAN_MARKER)
      return TTTGame::COMPUTER_MARKER if match?(line, TTTGame::COMPUTER_MARKER)
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
    # maybe a status to keep track of each square's mark
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end

  def add_point
    self.score += 1
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

  # overall program orchestration
  def play
    clear
    welcome_message
    play_game
    goodbye_message
  end

  private

  # turn orchestration method
  def play_a_turn
    loop do # begin_round
      human_moves
      break if board.someone_won? || board.full?
      computer_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
  end

  # game orchestration method
  def play_game
    loop do # begin_game
      display_board
      play_a_turn
      display_result
      break unless play_again?
      reset_game
      display_play_again_message
    end
  end

  def clear
    system 'clear'
  end

  def welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Choose a square: [#{board.formatted_unmarked_keys(', ')}]"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts 'Sorry that is not a valid choice.'
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts 'You win!'
    when computer.marker
      puts 'Computer won!'
    else
      puts 'The board is full!'
    end

    display_scores
  end

  def display_scores
    puts "The score is [Player: #{human.score} Computer: #{computer.score}"
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n'
    end

    answer != 'n'
  end

  def reset_game
    board.reset
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end
end

game = TTTGame.new
game.play
