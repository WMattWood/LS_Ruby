module Speak
  def speak(sound)
    sound.capitalize!
    puts "\"#{sound}!\""
  end
end

class GoodDog
  include Speak
end

class Human
  include Speak
end

Marcus = Human.new 
Sparky = GoodDog.new

Marcus.speak('howdy')
Sparky.speak('ruff ruff')