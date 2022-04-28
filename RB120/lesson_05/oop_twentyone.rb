class Participant
  attr_accessor :name, :hand

  def initialize
    @hand = []
    set_name
  end
end

module Hand

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
  SUITS = %w(Hearts Diamonds Clubs Spades)
  VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  
  def initialize
    @cards = shuffle_cards
  end

  def shuffle_cards
    shuffled_deck = VALUES.product(SUITS).shuffle
    shuffled_deck.map { |card| Card.new(card[0], card[1]) }
  end

  def deal_initial_hand(hand)
    2.times {hand << deal_one_card}
  end

  def deal_one_card
    @cards.pop
  end

  def empty?
  end
end

class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{self.value} of #{self.suit}"
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
    deal_cards
    display_cards
    player_turn
    # dealer_turn
    # show_result
  end

  def welcome_message
    puts "Welcome to 21 #{player.name}!"
  end

  def deal_cards
    deck.deal_initial_hand(player.hand)
    deck.deal_initial_hand(dealer.hand)
  end

  def display_cards
    puts "Dealer has: #{format_hand(dealer.hand)}"
    puts "Player has: #{format_hand(player.hand)}"
  end

  def format_hand(cards)
    cards.join(', ')
  end

  def player_turn
    loop do
      player_hit? ? (player.hand << deck.deal_one_card) : break
      display_cards
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

  def winner?
  end
end

Game.new.start