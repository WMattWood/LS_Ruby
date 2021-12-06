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

def attack_logic(brd)
  square = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      square = line.select { |marker| brd[marker] == ' ' }.first
    end
  end
  square
end

def defend_logic(brd)
  square = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      # i think the logic below can be refactored
      choice = line.select { |marker| brd[marker] == ' ' }.first
      square = choice if choice
    end
  end
  square
end

def fallback_logic(brd)
  brd[5] == ' ' ? 5 : empty_squares_array(brd).sample
end

def computer_places_piece!(brd)
  sleep 2
  square = attack_logic(brd)
  square = defend_logic(brd) if !square
  square = fallback_logic(brd) if !square
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

def board_full?(brd)
  empty_squares_array(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

# rubocop: disable Metrix/CyclomaticComplexity, Metrix/PerceivedComplexity
def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end
# rubocop: enable Metrix/CyclomaticComplexity, Metrix/PerceivedComplexity

### GAME LOOP
score = { computer: 0, player: 0 }
loop do
  board = initialize_board

  # Who Goes First Logic
  p1 = nil
  players = ['Player', 'Computer']
  prompt "Who should go first? (Me or You)"
  answer = gets.chomp.downcase
  if answer.start_with? 'y'
    p1 = 'Computer'
  elsif answer.start_with? 'm'
    p1 = 'Player'
  else
    prompt "Okay then I will choose..."
    sleep 1.8
    p1 = players.sample
  end
  prompt "#{p1} goes first."
  sleep 2

  loop do
    display_board(board)
    place_piece!(board, p1)
    p1 = alternate_player(p1)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    # Chose to keep this line 'too long' for the sake of readability.
    # I did try doing a multi-line ternary expression but rubocop did not
    # like that either.
    detect_winner(board) == 'Computer' ? score[:computer] += 1 : score[:player] += 1
  else
    prompt "It's a tie!"
  end

  prompt "The score is Computer: #{score[:computer]} Player: #{score[:player]}"

  if score[:computer] == 5
    prompt "Computer wins this round."
    score.each { |player, _| score[player] = 0 }
  elsif score[:player] == 5
    prompt "You win this round!"
    score.each { |player, _| score[player] = 0 }
  end
  prompt "Play again? (Y/N)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Goodbye!  Thank you for playing checkers."
