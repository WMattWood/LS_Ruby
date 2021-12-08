require 'pry-byebug'

SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', "Jack", "Queen", "King", "Ace"]
WELCOME = "***** WELCOME TO THE CASINO *****"
TABLE = "__________21 TABLE__________"

def prompt(message)
  puts "=> #{message}"
end

def shuffle_cards()
  VALUES.product(SUITS).shuffle
end

def format_hand(cards)
  parsed = cards.map {|card| "#{card[0]} of #{card[1]}"}
  # parsed.last.prepend('and ')
  # if parsed.size > 2
  #   parsed.join(', ')
  # else
  #   parsed.join(' ')
  # end
  parsed.join(', ')
end

def show_cards(dealer, player)
  system 'clear'
  puts TABLE
  prompt "Dealer has: #{format_hand(dealer)}"
  prompt "Player has: #{format_hand(player)}"
end

def deal(hand)
  system 'clear'
  puts "Dealing..."
  sleep 1
end

def total(hand)
  # create array of card values
  values = hand.map {|card| card[0]}
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
  values.select{ |card| card == "Ace"}.count.times do
    total -= 10 if total > 21
  end

  total
end

# test_hand = [['7', 'x'], ['Ace', 'x'], ['Ace', 'x'], ['Ace', 'x']]
# puts total(test_hand)

def compare(dealer, player)
  if total(dealer) >= total(player)
    'Dealer Wins'
  else
    'Player Wins'
  end
end

# LOAD MESSAGE
puts WELCOME
sleep 2
# MAIN LOOP
loop do
# 1. Initialize deck
deck = shuffle_cards

  # DECK LOOP
  loop do
    # 2. Deal cards to player and dealer
    player_hand = []
    dealer_hand = []
    player_win = false
    dealer_win = false

    2.times do dealer_hand << deck.pop end
    2.times do player_hand << deck.pop end
    # 3. Player turn
    loop do
      # - Display hand
      show_cards(dealer_hand, player_hand)
      # - Hit or stay
      prompt "Do you want to stay or hit? (Stay/Hit)"
      answer = gets.chomp.downcase
      # - Repeat until bust or 'stay'
      if answer.chars.first == 's'
        prompt "Player stays."
        sleep 1
        break
      elsif answer.chars.first == 'h'
        prompt "Player hits."
        player_hand << deck.pop
        sleep 1
      else
        prompt "Ahem... I'll try that again."
        sleep 2
      end
      # 4. If player bust, dealer wins.
      if total(player_hand) > 21
        # - Display hand
        show_cards(dealer_hand, player_hand)
        prompt "Player busts."
        dealer_win = true
        break
      end
    end

    # 5. Dealer turn
    if !dealer_win 
      loop do
        # - Display hand
        show_cards(dealer_hand, player_hand)
        # - Hit or stay
        # - Repeat until total >= 17
        if total(dealer_hand) >= 17 
          prompt "Dealer stays."
          sleep 1
          break
        else 
          prompt "Dealer hits."
          dealer_hand << deck.pop
          sleep 1
        end
        # 6. If dealer bust, player wins.
        if total(dealer_hand) > 21
          # - Display hand
          show_cards(dealer_hand, player_hand)
          prompt "Dealer busts."
          player_win = true
          break
        end
      end
    end

    # 7. Compare cards and declare a winner
    if player_win
      prompt "Player wins."
    elsif dealer_win
      prompt "Dealer wins."
    elsif total(player_hand) >= total(dealer_hand)
      prompt "Player wins."
    else
      prompt "Dealer wins."
    end

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

#9. Reshuffle the deck?
prompt "Would you like to reshuffle the deck and start again? (Y/N)"
answer = gets.chomp.downcase
if answer.chars.first == 'y' 
  system 'clear'
  prompt "Shuffling..." 
  sleep 1
  prompt "Dealing..." 
  sleep 1
else
  system 'clear'
  prompt "Thank you for playing 21."
  sleep 1
  break
end

end







