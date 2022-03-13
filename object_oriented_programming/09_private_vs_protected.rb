class Person
  attr_writer :age

  def initialize(name)
    @name = name
  end

  def age_against(other)
    if age == other.age
      "#{name} is same age as #{other.name}."
    elsif age < other.age
      "#{name} is younger than #{other.name}."
    else
      "#{name} is older than #{other.name}."
    end
  end

# protected # try to change this to private
private

  def age
    @age
  end

  def name
    @name
  end
end


bob = Person.new("Bob")
bob.age = 20
jane = Person.new("Jane")
jane.age = 19
puts bob.age_against(jane)