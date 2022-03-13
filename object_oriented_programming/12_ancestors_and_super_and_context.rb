class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak

# when super is invoked, it pulls the method from the superclass and
# calls it WITHIN THE CONTEXT WHERE SUPER WAS INVOKED.  It is as if
# that method were located in the class where super was invoked, and 
# thus would have access to all the methods accessible to that class.

# also... objects have access to their ancestor's methods.  similarly
# to above with super, when an ancestor method is invoked/called, it is
# executed within the object's specific class context.  so the method 
# #speak from the Animal superclass that references method #sound has
# access to all the ancestor methods, and the instance methods in Cow