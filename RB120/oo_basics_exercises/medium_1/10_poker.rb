# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

class PokerHand
  attr_reader :cards, :test_hand, :sorted_ranks
  def initialize(deck)
    @cards = []
    @test_hand = []
    5.times do @cards << deck.draw end
    @sorted_ranks = @cards.map { |card| card.rank_value }.sort
  end

  def print
    "You have a #{evaluate(@cards)}."
  end

  def evaluate
    case 
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def flush?
    match_suit = cards.first.suit
    cards.all? { |card| card.suit == match_suit}
  end

  def straight?
    values = self.cards.map { |card| card.rank_value }
    is_sequential?(values)
  end

  def is_sequential?(arr)
    arr = arr.sort
    test_arr = arr[1..-1]
    test_arr.each_with_index do |item, idx| 
      return false unless arr[idx] == item - 1
    end
    true
  end

  def straight_flush?
    flush? && straight?
  end

  def royal_flush?
    flush? && straight? && sorted_ranks.first == 10
  end

  def four_of_a_kind?
    same_of_a_kind(4)
  end

  def full_house?
    same_of_a_kind(3) && same_of_a_kind(2)
  end

  def three_of_a_kind?
    same_of_a_kind(3)
  end

  def two_pair?
    sorted_ranks.select { |rank| sorted_ranks.count(rank) == 2 }.uniq.size == 2
  end

  def pair?
    same_of_a_kind(2)
  end

  def same_of_a_kind(num)
    sorted_ranks.any? { |rank| sorted_ranks.count(rank) == num}
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = shuffled_deck
  end

  def shuffled_deck
    deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(rank, suit)
      end
    end
    deck.shuffle!
  end

  def draw
    @cards = shuffled_deck if @cards.empty?
    @cards.pop
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def rank_value
    case rank
    when 'Ace'   then 14
    when 'King'  then 13
    when 'Queen' then 12
    when 'Jack'  then 11
    else rank
    end
  end

  def <=>(other)
    self.rank_value <=> other.rank_value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'