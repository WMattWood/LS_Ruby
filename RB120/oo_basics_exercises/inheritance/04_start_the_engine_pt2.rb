class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + " Drive #{speed} please!"
  end
end

# Calling super with empty parenthesis prevents super from passing up any arguments
# If super was called without parenthesis, the superclass start_engine method would
# throw a wrong number of arguments error

truck1 = Truck.new
puts truck1.start_engine('fast')