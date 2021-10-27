produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_hash)
  fruit_hash = {}
  
  produce_hash.each do |key, value|
    if value == 'Fruit'
      fruit_hash[key] = value
    end
  end

  fruit_hash
end

# TEST CASE
p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}