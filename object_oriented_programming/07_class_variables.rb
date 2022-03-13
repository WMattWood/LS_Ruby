class GoodDog
  #the use of @@ specifies a class variable, not specific to each instance
  @@number_of_dogs = 0

  #class variable @@number_of_dogs gets incremented whenever #new is called
  def initialize
    @@number_of_dogs += 1
  end

  #the use of self. in the method definition specifies a class method
  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs   # => 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs   # => 2