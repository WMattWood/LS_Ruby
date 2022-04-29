require 'pry'

module Hand
  def total
    total = 0
    hand.each do |card|
      total += case card.value
               when 'Ace' then 11
               when 'Jack' then 10
               when 'Queen' then 10
               when 'King' then 10
               else card.value.to_i
               end
    end

    hand.select { |card| card.value == "Ace" }.count.times do
      total -= 10 if total > 21
    end
    total
  end

  def show_hand
    hand.join(', ')
  end

  def bust?
    total > 21
  end

  def hit(deck)
    hand << deck.deal_one_card
  end
end

class Participant
  include Hand
  attr_accessor :name, :hand, :score

  def initialize
    @hand = []
    @score = 0
    set_name
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
end

class Dealer < Participant
  DEALER_NAMES = ['Roger', 'Stefan', 'Audrey', 'Carmen']

  def set_name
    self.name = DEALER_NAMES.sample
  end
end

class Deck
  attr_reader :cards

  SUITS = %w(Hearts Diamonds Clubs Spades)
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
    cards.empty?
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

class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    welcome_message
    loop do
      deal_cards
      display_cards
      player_turn
      dealer_turn if !player.bust?
      show_result
      break unless continue_game?
      system 'clear'
    end
    goodbye_message
  end

  def welcome_message
    system 'clear'
    puts "Welcome to 21 #{player.name}!"
  end

  def deal_cards
    deck.deal_hand(player)
    deck.deal_hand(dealer)
  end

  def display_cards
    system 'clear'
    puts "Dealer has: #{dealer.show_hand}"
    puts "Player has: #{player.show_hand}"
    puts "Dealer total is #{dealer.total}"
    puts "Your total is #{player.total}"
  end

  def player_turn
    loop do
      if player.bust?
        puts "Player busts."
        break
      end
      player_hit? ? (player.hit(deck)) : break
      display_cards
    end
  end

  def dealer_turn
    loop do
      if dealer.bust?
        puts "Dealer busts."
        break
      end
      if dealer_hit?
        puts "The dealer hits..."
        sleep 2
        dealer.hit(deck)
      else
        puts "The dealer stays."
        sleep 2
        break
      end
      display_cards
      sleep 2
    end
  end

  def player_hit?
    puts "Would you like to [H]it or [S]tay? (H/S)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(h s).include? answer
      puts "Please enter 'h' or 's' to hit or stay."
    end
    answer == 'h'
  end

  def dealer_hit?
    dealer.total < 18 && dealer.total <= player.total
  end

  def show_result
    if player.bust?
      dealer_wins
    elsif dealer.bust?
      player_wins
    else
      dealer.total > player.total ? dealer_wins : player_wins
    end
  end

  def player_wins
    puts "#{player.name} wins the hand."
    player.score += 1
  end

  def dealer_wins
    puts 'Dealer wins the hand.'
    dealer.score += 1
  end

  def continue_game?
    puts "Would you like to play another hand? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Please enter 'y' or 'n'"
    end
    answer == 'y'
  end

  def goodbye_message
    puts 'Thank you for playing!'
  end
end

Game.new.start
