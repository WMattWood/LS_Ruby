require "pry"
# This was a first, failed attempt.  
# Do not forget - if you pass a bunch of variables to a bunch of arrays,
# all of those variables probably point to the same underlying object.

def initialize_deck()
  deck = {}
  suits = ['hearts', 'diamonds', 'clubs', 'spades']
  values = []
  (1..10).each {|num| values << num}
  ['jack', 'queen', 'king', 'ace'].each { |face_card| values << face_card } 
  suits.each do |suit|
    deck[suit.to_sym] = values
  end
  deck
end

def print_deck(dck)
  dck.each {|x| p x}
end

# def pick_suit(dck)
#   dck.keys.sample
# end

# def pick_value(dck, suit)
#   dck[suit].sample
# end

def card(dck)
  suit = dck.keys.sample
  value = dck[suit].sample
  p "#{value} of #{suit}"
end

def empty_deck(dck)
  suit = dck.keys.sample
  cards = dck[suit]
  cards.delete(cards.sample)
end

deck = initialize_deck
print_deck(deck)

10.times do 
  empty_deck(deck)
end

print_deck(deck)

# This solution didn't work!!! Why?  
# This was the data structure I tried to implement
[:hearts, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]]
[:diamonds, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]]
[:clubs, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]]
[:spades, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]]
# What happens here in my #initialize_deck method definition, is that
# when I populate the 'values array', the methods I used to populate each 'array' 
# does so with ___references___  ____to__the__same__underlying__object____.  
=> values = []
=> (1..10).each {|num| values << num}
=> ['jack', 'queen', 'king', 'ace'].each { |face_card| values << face_card } 
# This means that when I try to modify any of those arrays, the mutating method
# used to accomplish that actually mutates ALL of the arrays... because it is 
# the same, single set of values.
=> [:diamonds, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]]
=> [:hearts, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]]
=> [:clubs, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]]
=> [:spades, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]]
=> 
=> 10.times do 
=>   empty_deck(deck)
=> end
=> 
=> [:hearts, [5, 8, 9, 10]]
=> [:diamonds, [5, 8, 9, 10]]
=> [:clubs, [5, 8, 9, 10]]
=> [:spades, [5, 8, 9, 10]]
# WHOOPSIE DAISY