SUITS = %w(Hearts Diamonds Clubs Spades)
VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
WELCOME = "***** WELCOME TO THE CASINO *****"
TABLE = "__________21 TABLE__________"

def prompt(message)
  puts "=> #{message}"
end

def shuffle_cards
  shuffled_deck = VALUES.product(SUITS).shuffle
  shuffled_deck.map { |card| Hash[value: card[0], suit: card[1]] }
end

def format_hand(cards)
  parsed = cards.map { |card| "#{card[:value]} of #{card[:suit]}" }
  parsed.join(', ')
end

def show_cards(dealer, player)
  system 'clear'
  puts TABLE
  prompt "Dealer has: #{format_hand(dealer)}"
  prompt "Player has: #{format_hand(player)}"
end

def busted?(hand)
  total(hand) > 21
end

def player_win?(dealer, player)
  total(player) <= 21 && total(player) > total(dealer)
end

def dealer_win?(dealer, player)
  total(dealer) <= 21 && total(dealer) > total(player)
end

def display_round_totals(pts_hash)
  puts '==================================='
  prompt "Dealer has won #{pts_hash[:dealer]} hands."
  prompt "Player has won #{pts_hash[:player]} hands."
  puts '==================================='
end

def total(hand)
  # create array of card values
  values = hand.map { |card| card[:value] }
  total = 0

  # add up values
  values.each do |value|
    total = if value == 'Ace'
              total + 11
            elsif value.to_i == 0
              total + 10
            else
              total + value.to_i
            end
  end

  # correct based on number of aces if over 21
  values.select { |card| card == "Ace" }.count.times do
    total -= 10 if total > 21
  end

  total
end

# LOAD MESSAGE
puts WELCOME
sleep 2

# MAIN LOOP
loop do
  # 1. Initialize deck
  deck = shuffle_cards
  points = { dealer: 0, player: 0 }
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

    2.times { dealer_hand << deck.pop }
    2.times { player_hand << deck.pop }
    total_player = total(player_hand)
    total_dealer = total(dealer_hand)

    hidden_hand = [{ value: 'XXX', suit: 'XXXXX' }, dealer_hand[1]]

    # 3. Player turn
    loop do
      # - Display hand
      show_cards(hidden_hand, player_hand)
      # - Hit or stay
      prompt "Player currently has: #{total_player}"
      prompt "Do you want to stay or hit? (Stay/Hit)"
      answer = gets.chomp.downcase
      # - Repeat until bust or 'stay'
      if answer == 's' || answer == 'stay'
        prompt "Player stays."
        sleep 2
        break
      elsif answer == 'h' || answer == 'hit'
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
        break
      end
    end

    # 5. Dealer turn
    if !busted?(player_hand)
      loop do
        # - Display hand
        show_cards(dealer_hand, player_hand)
        prompt "Dealer is at: #{total_dealer}"
        sleep 2
        # 6. If dealer bust, player wins.
        if total_dealer > 21
          # - Display hand
          prompt "Dealer busts."
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
    if busted?(player_hand) || dealer_win?(dealer_hand, player_hand)
      prompt "Dealer wins."
      points[:dealer] += 1
    elsif busted?(dealer_hand) || player_win?(dealer_hand, player_hand)
      prompt "Player wins."
      points[:player] += 1
    else
      prompt "It's a tie."
    end

    sleep 2

    display_round_totals(points)

    # 8. Another hand?
    if deck.size < 4
      prompt "That's it for this deck."
      break
    else
      prompt "Play another hand? (Y/N)"
      answer = gets.chomp.downcase
      break unless answer == 'y' || answer == 'yes'
    end
  end

  # 9. Reshuffle the deck?
  prompt "Would you like to reshuffle the deck and start again? (Y/N)"
  answer = gets.chomp.downcase
  unless answer == 'y' || answer == 'yes'
    system 'clear'
    prompt "Thank you for playing 21."
    sleep 1
    break
  end
end
