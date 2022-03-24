# Requirements
# Classes:
# Pet 
  # Methods: initialize, name_reader, species_reader
  # Variables: name, species
# Owner 
  # Methods: initialize, name_reader, number_of_pets_reader
  # Variables: name
# Shelter
  # Methods: initialize, adopt, print_adoptions
  # Variables: 

  class Shelter
    attr_accessor :adoptions

    def initialize
      @adoptions = {}
    end

    def adopt(owner, pet)
      owner.number_of_pets += 1
      if adoptions[owner]
        adoptions[owner] << pet
      else
        adoptions[owner] = []
        adoptions[owner] << pet
      end
    end

    def print_adoptions
      adoptions.each do |owner, _|
        puts "#{owner.name} has adopted the following pets:"
        adoptions[owner].each do |pet|
          puts "a #{pet.species} named #{pet.name}"
        end
        puts "\n"
      end
    end 

  end

class Owner
  attr_accessor :number_of_pets
  attr_reader :name

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
end

class Pet
  attr_reader :name, :species

  def initialize(species, name)
    @species = species
    @name = name
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.