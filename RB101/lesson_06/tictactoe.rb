require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = "O"


### METHODS
def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrix/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}.  Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrix/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares_array(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_squares_array(brd)
  brd.keys.select { |num| brd[num] == PLAYER_MARKER }
end

def computer_squares_array(brd)
  brd.keys.select { |num| brd[num] == PLAYER_MARKER }
end

def joinor(arr, joint=', ', last_join='or ')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{last_join} ")
  else 
    arr[-1] = last_join + arr.last.to_s
    arr.join(joint)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares_array(brd))}"
    square = gets.chomp.to_i
    break if empty_squares_array(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  # Defend Logic
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      square = line.select { |marker| brd[marker] == ' ' }.first
    end
  end
  # Attack Logic
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      square = line.select { |marker| brd[marker] == ' ' }.first
    end
  end
  # Fallback - pick a random empty square
  if !square
    square = empty_squares_array(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares_array(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # READABLE OPTION
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
    # CLEVER IDIOMATIC RUBY OPTION
    # if brd.values_at(*line).count(PLAYER_MARKER) == 3
    #   return 'Player'
    # elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
    #   return 'Computer'
    # end
  end
  nil
end

### GAME LOOP
score = { computer: 0, player: 0 }
loop do
  board = initialize_board
  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    detect_winner(board) == 'Computer' ? score[:computer] += 1 : score[:player] += 1
  else
    prompt "It's a tie!"
  end

  prompt "The score is Computer: #{score[:computer]} Player: #{score[:player]}"
  
  if score[:computer] == 5
    prompt "Computer wins this round."
    score.each { |player, pts| score[player] = 0 }
  elsif score[:player] == 5
    prompt "You win this round!"
    score.each { |player, pts| score[player] = 0 }
  end
  prompt "Play again? (Y/N)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Goodbye!  Thank you for playing checkers."
