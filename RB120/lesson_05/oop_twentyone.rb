require 'pry'

module GameFlow
  def clear
    system 'clear'
  end

  def pause(time=2)
    sleep time
  end
end

class Game
  include GameFlow
  attr_reader :player, :dealer
  attr_accessor :deck

  def initialize
    clear
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def welcome_message
    clear
    pretty_print "Welcome to 21 #{player.name}!"
    pretty_print "Your dealer today is #{dealer.name}."
  end

  def start
    welcome_message
    loop do
      play_one_round
      show_result
      continue_game? ? next : break
    end
    goodbye_message
  end

  private

  def play_one_round
    loop do
      deal_cards
      player_turn
      break if player.bust?
      dealer_turn
      dealer.stays unless dealer.bust?
      break
    end
  end

  def deal_cards
    clear
    pretty_print "Dealing a new hand..."
    pause
    deck.deal_hand(player)
    deck.deal_hand(dealer)
    display_initial_deal
  end

  def display_initial_deal
    clear
    pretty_print "Dealer has: XXX of XXXXX, #{dealer.hand[1]}"
    pretty_print "Player has: #{player.show_hand}"
    pause(1)
    puts "Your total is #{player.total}"
    pause
  end

  def display_hidden_cards
    clear
    puts "Dealer has: XXX of XXXXX, #{dealer.hand[1]}"
    puts "Player has: #{player.show_hand}"
    puts "Your total is #{player.total}"
    pause
  end

  def reveal_dealer_card
    clear
    puts "Dealer has: #{dealer.show_hand}"
    puts "Player has: #{player.show_hand}"
    puts "Your total is #{player.total}"
    pause
  end

  def display_cards
    clear
    puts "Dealer has: #{dealer.show_hand}"
    puts "Player has: #{player.show_hand}"
    puts "Dealer total is #{dealer.total}"
    puts "Your total is #{player.total}"
    pause
  end

  # PLAYER METHODS
  def player_turn
    loop do
      if player.bust?
        reveal_dealer_card
        player.goes_bust
        break
      end
      break unless player_wants_to_hit?
      player.hit(deck)
      display_hidden_cards
    end
  end

  def player_wants_to_hit?
    puts "Would you like to [H]it or [S]tay? (H/S)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(h s).include? answer
      puts "Please enter 'h' or 's' to hit or stay."
    end
    answer == 'h'
  end

  # DEALER METHODS
  def dealer_turn
    display_cards
    loop do
      if dealer.bust?
        dealer.goes_bust
        break
      end
      break unless dealer_should_hit?
      dealer.hit(deck)
      display_cards
    end
  end

  def dealer_should_hit?
    dealer.total < 18 && dealer.total <= player.total
  end

  # GAME OUTCOME METHODS
  def show_result
    if player.bust? then dealer.wins
    elsif dealer.bust? then player.wins
    elsif tie? then tie_game
    else determine_winner
    end
    show_round_score
  end

  def tie?
    dealer.total == player.total
  end

  def tie_game
    puts "It's a tie!"
    pause
  end

  def determine_winner
    dealer.total > player.total ? dealer.wins : player.wins
  end

  # END OF ROUND METHODS
  def show_round_score
    clear
    puts "#{dealer.name}'s score is: #{dealer.score}"
    puts "#{player.name}'s score is: #{player.score}"
  end

  def continue_game?
    deck.finished? ? ask_to_reshuffle : play_again?
  end

  def play_again?
    puts "Would you like to play another hand? (y/n)"
    player.approves?
  end

  def ask_to_reshuffle
    puts "This deck is finished.  Would you like to reshuffle the deck? (y/n)"
    reshuffle if player.approves?
  end

  def reshuffle
    clear
    puts "Reshuffling..."
    pause
    self.deck = Deck.new
  end

  def goodbye_message
    puts 'Thank you for playing!'
  end

  def pretty_print(string)
    string.chars.each do |char|
      print char
      sleep 0.03
    end
    puts "\n"
    pause
  end
end

module Hand
  def total
    total = 0
    total = calculate_card_values(total)
    hand.select { |card| card.value == "Ace" }.count.times do
      total -= 10 if total > 21
    end
    total
  end

  def calculate_card_values(total)
    hand.each do |card|
      total += case card.value
               when 'Ace' then 11
               when 'Jack' then 10
               when 'Queen' then 10
               when 'King' then 10
               else card.value.to_i
               end
    end
    total
  end

  def show_hand
    hand.join(', ')
  end

  def bust?
    total > 21
  end
end

class Participant
  include Hand
  include GameFlow
  attr_accessor :name, :hand, :score

  def initialize
    @hand = []
    @score = 0
    set_name
  end

  def goes_bust
    puts "#{name} busts."
    pause
  end

  def wins
    puts "#{name} wins the hand."
    self.score += 1
    pause(3)
  end
end

class Player < Participant
  def set_name
    answer = nil
    loop do
      puts "What's your name?"
      answer = gets.chomp.capitalize
      break unless answer.empty?
      puts "Sorry, you must state your name"
    end
    self.name = answer
  end

  def hit(deck)
    puts "#{name} hits..."
    hand << deck.deal_one_card
    pause
  end

  def approves?
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Please enter 'y' or 'n'"
    end
    answer == 'y'
  end
end

class Dealer < Participant
  DEALER_NAMES = ['Roger', 'Stefan', 'Audrey', 'Carmen']

  def set_name
    self.name = DEALER_NAMES.sample
  end

  def hit(deck)
    pause
    puts "#{name} hits..."
    hand << deck.deal_one_card
    pause
  end

  def stays
    puts "#{name} stays."
    pause
  end
end

class Deck
  attr_reader :cards

  SUITS = %w(Hearts Diamonds Clubs Spades)
  # SUITS = %w(Hearts)
  VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

  def initialize
    @cards = shuffle_cards
  end

  def shuffle_cards
    shuffled_deck = SUITS.product(VALUES).shuffle
    shuffled_deck.map { |card| Card.new(card[0], card[1]) }
  end

  def deal_hand(participant)
    participant.hand = []
    2.times { participant.hand << deal_one_card }
  end

  def deal_one_card
    cards.pop
  end

  def finished?
    cards.size < 8
  end
end

class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value} of #{suit}"
  end
end

Game.new.start
