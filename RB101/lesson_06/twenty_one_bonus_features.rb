# require 'pry-byebug'

SUITS = %w(Hearts Diamonds Clubs Spades)
VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
WELCOME = "***** WELCOME TO THE CASINO *****"
TABLE = "__________21 TABLE__________"

def prompt(message)
  puts "=> #{message}"
end

def shuffle_cards
  VALUES.product(SUITS).shuffle
end

def format_hand(cards)
  parsed = cards.map { |card| "#{card[0]} of #{card[1]}" }
  parsed.join(', ')
end

def show_cards(dealer, player)
  system 'clear'
  puts TABLE
  prompt "Dealer has: #{format_hand(dealer)}"
  prompt "Player has: #{format_hand(player)}"
end

def display_round_totals(pts_array)
  puts '==================================='
  prompt "Dealer has won #{pts_array[0]} hands."
  prompt "Player has won #{pts_array[1]} hands."
  puts '==================================='
end

# rubocop: disable Style/ConditionalAssignment
def total(hand)
  # create array of card values
  values = hand.map { |card| card[0] }
  total = 0

  # add up values
  values.each do |value|
    if value == 'Ace'
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  # correct based on number of aces if over 21
  values.select { |card| card == "Ace" }.count.times do
    total -= 10 if total > 21
  end

  total
end
# rubocop: enable Style/ConditionalAssignment

# def compare(dealer, player)
#   if total(dealer) >= total(player)
#     'Dealer Wins'
#   else
#     'Player Wins'
#   end
# end

# LOAD MESSAGE
puts WELCOME
sleep 2

# MAIN LOOP
loop do
  # 1. Initialize deck
  deck = shuffle_cards
  points_array = [0,0]
  system 'clear'
  prompt "Shuffling..."
  sleep 2
  prompt "Dealing..."
  sleep 2

  # DECK LOOP
  loop do
    # 2. Deal cards to player and dealer
    player_hand = []
    dealer_hand = []
    player_win = false
    dealer_win = false

    2.times { dealer_hand << deck.pop }
    2.times { player_hand << deck.pop }
    total_player = total(player_hand)
    total_dealer = total(dealer_hand)

    hidden_hand = [['XXX', 'XXXXX'], dealer_hand[1]]

    # 3. Player turn
    loop do
      # - Display hand
      show_cards(hidden_hand, player_hand)
      # - Hit or stay
      prompt "Player currently has: #{total_player}"
      prompt "Do you want to stay or hit? (Stay/Hit)"
      answer = gets.chomp.downcase
      # - Repeat until bust or 'stay'
      if answer.chars.first == 's'
        prompt "Player stays."
        sleep 2
        break
      elsif answer.chars.first == 'h'
        prompt "Player hits."
        player_hand << deck.pop
        total_player = total(player_hand)
        sleep 2
      else
        prompt "Ahem... I'll try that again."
        sleep 2
      end
      # 4. If player bust, dealer wins.
      if total_player > 21
        # - Display hand
        show_cards(dealer_hand, player_hand)
        prompt "Player currently has: #{total_player}"
        sleep 2
        prompt "Player busts."
        sleep 2
        dealer_win = true
        break
      end
    end

    # 5. Dealer turn
    if !dealer_win
      loop do
        # - Display hand
        show_cards(dealer_hand, player_hand)
        prompt "Dealer is at: #{total_dealer}"
        sleep 2
        # 6. If dealer bust, player wins.
        if total_dealer > 21
          # - Display hand
          prompt "Dealer busts."
          player_win = true
          sleep 2
          break
        end
        # - Hit or stay
        # - Repeat until total >= 17
        if total_dealer >= 17
          prompt "Dealer stays."
          sleep 2
          break
        else
          prompt "Dealer hits."
          dealer_hand << deck.pop
          total_dealer = total(dealer_hand)
          sleep 2
        end
      end
    end

    # 7. Compare cards and declare a winner
    if player_win
      prompt "Player wins."
      points_array[1] += 1
    elsif dealer_win
      prompt "Dealer wins."
      points_array[0] += 1
    elsif total_player > total_dealer
      prompt "Player wins."
      points_array[1] += 1
    elsif total_dealer > total_player
      prompt "Dealer wins."
      points_array[0] += 1
    else
      prompt "It's a tie."
    end

    sleep 2

    display_round_totals(points_array)

    # 8. Another hand?
    if deck.size < 4
      prompt "That's it for this deck."
      break
    else
      prompt "Play another hand? (Y/N)"
      answer = gets.chomp.downcase
      break unless answer.chars.first == 'y'
    end
  end

  # 9. Reshuffle the deck?
  prompt "Would you like to reshuffle the deck and start again? (Y/N)"
  answer = gets.chomp.downcase
  if answer.chars.first != 'y'
    system 'clear'
    prompt "Thank you for playing 21."
    sleep 1
    break
  end
end