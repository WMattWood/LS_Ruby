require 'pry'

# THIS ONE WAS ABANDONED BECAUSE THE FLOW FELT SLOPPY.  
# STARTING FROM SCRATCH BUT REUSING PARTS OF THIS CODE.

SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', "Jack", "Queen", "King", "Ace"]
WELCOME = "***** WELCOME TO THE CASINO *****"
TABLE = "__________21 TABLE__________"

def prompt(message)
  puts "=> #{message}"
end

def format_hand(cards)
  parsed = cards.map {|card| "#{card[1]} of #{card[0]}"}
  parsed.last.prepend('and ')
  if parsed.size > 2
    parsed.join(', ')
  else
    parsed.join(' ')
  end
end

def deal()
  puts "Dealing..."
  sleep 2
end

def dealer_thinks()
  sleep 1
  puts '...'
  sleep 1
  p 'dealer is thinking'
  puts '...'
  sleep 1
end

def show_cards(dealer, player)
  system 'clear'
  puts TABLE
  prompt "Dealer has: #{format_hand(dealer)}"
  prompt "Player has: #{format_hand(player)}"
  prompt "Player hand value: #{total(player)}"
end

def total(cards)
  # cards = [['Hearts', '1'], ['Clubs', 'King'], ['Spades', 'Ace'], ... ] 
  values = cards.map {|card| card[1]}
  total = 0
  aces = 0

  cards.each do |card|
    if card[1] == 'Ace'
      total += 11
      aces += 1
    elsif card[1].to_i == 0 # 'Queen', 'King', 'Jack', will convert to 0
      total += 10
    else
      total += card[1].to_i
    end
  end
  #binding.pry
  while total > 21 && aces > 0
    total -= 10
    aces - 1
  end
  #binding.pry
  total
end

def compare(dealer, player)
  if total(dealer) >= total(player)
    'Dealer Wins'
  else
    'Player Wins'
  end
end

def game_over(state)
  #binding.pry
  case state
  when 'Player Bust'
    prompt "Player has bust."
  when 'Dealer Bust'
    prompt "Dealer has bust."
  when 'Player Wins'
    prompt "Player wins this hand."
  when 'Dealer Wins'
    prompt "Dealer wins this hand."
  end
end

#MAIN LOOP
loop do
  puts WELCOME
  sleep 2
  #INITIALIZE DECK
  deck = SUITS.product(VALUES).shuffle
  player_hand = []
  dealer_hand = []
  test_hand = [['Spades', 'Ace'], ['Clubs', 'Ace'], ['Diamonds', 'Ace']] # 13
  test_hand2 = [['Spades', 'Ace'], ['Clubs', 'King'], ['Diamonds', 'Queen']] # 21

  #DEAL
  2.times do dealer_hand << deck.pop end
  2.times do player_hand << deck.pop end

  #PLAY
  loop do
    state = 'Play'
    #PLAYER TURN
    loop do
      show_cards(dealer_hand, player_hand)
      prompt "Do you want to stay or hit? (Stay/Hit)"
      answer = gets.chomp.downcase
      if answer.chars.first == 's'
        break
      elsif answer.chars.first == 'h'
        deal
        player_hand << deck.pop
        if total(player_hand) > 21
          state = 'Player Bust'
          break
        end
      else
        prompt "Ahem... I'll try that again."
      end
    end

    #PLAYER BUST?
    if state == 'Player Bust'
      game_over(state) 
      break
    end

    #DEALER TURN
    loop do
      show_cards(dealer_hand, player_hand)
      prompt "Dealer hand value: #{total(dealer_hand)}"
      dealer_thinks
      if total(dealer_hand) >= 17
        sleep 2
        puts "Dealer Stays"
        break
      else
        deal
        dealer_hand << deck.pop
        if total(dealer_hand) > 21
          prompt "Dealer busts"
          state = 'Dealer Bust'
          break
        end
      end
    end
    
    #DEALER BUST?
    if state == 'Dealer Bust'
      game_over(state) 
    else
      state = compare(dealer_hand, player_hand)
      game_over(state)
    end

    #DETERMINE WINNER
    state = compare(dealer_hand, player_hand)
    game_over(state)

    # PLAY AGAIN?
    prompt "Play another hand? (Y/N)"
    answer = gets.chomp.downcase
    break unless answer.chars.first == 'y'

  end

  prompt "Would you like to reshuffle the deck and start again? (Y/N)"
  answer = gets.chomp.downcase
  break unless answer.chars.first == 'y'

end
p 'Thank you for playing!'