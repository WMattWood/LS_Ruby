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

  NUMERIC_VALUES = { 'Ace' => 14,
                     'King' => 13,
                     'Queen' => 12,
                     'Jack' => 11
                   }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def rank_value
    (2..10).include?(@rank) ? @rank : NUMERIC_VALUES[@rank]
  end

  def <=>(other)
    self.rank_value <=> other.rank_value
  end

  def to_s
    "#{@rank} of #{@suit}"
  end
end

### Tests ###
# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# p drawn.count { |card| card.rank == 5 } == 4
# p drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# p drawn != drawn2 # Almost always.