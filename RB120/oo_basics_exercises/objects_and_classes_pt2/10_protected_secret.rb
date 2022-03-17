class Person
  attr_writer :secret

  def compare_secret(other_person)
    # accesses own @secret
    p self.secret
    # accesses secret of other object (NOTE: THIS WOULD NOT BE POSSIBLE 
    # WITH A PRIVATE GETTER METHOD FOR @secret )
    p other_person.secret
    #compares @secret from each object
    self.secret == other_person.secret # expects false
  end

  protected # this works because objects of the class can access this stuff
  # private # try this, it will error out because the objects cannot access it

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)