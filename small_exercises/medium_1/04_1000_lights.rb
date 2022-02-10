def light_switcher(n)
  
  # create hash structure
  lights = {}
  1.upto(n) do |idx|
    lights[idx] = false
  end

  # iterate over hash structure
  1.upto(n) do |current| 
    lights.each do |k, v| 
      if (k % current == 0)
          lights[k] = flip(v) 
      end
    end
  end

  # output
  output = []
  lights.each { |k, _| output << k if lights[k] }
  output
end

def flip(value)
  value ? false : true
end

# Input: an integer representing a number of lights
# Output: an array of all numbers corresponding to lights which are currently on
  # Rules:
# Examples:
p light_switcher(1) == [1]
p light_switcher(2) == [1]
p light_switcher(3) == [1]
p light_switcher(4) == [1, 4]
p light_switcher(5) == [1, 4]
p light_switcher(10) == [1, 4, 9]
p light_switcher(1000) == [1, 4, 9, 16, 25, 36,
                           49, 64, 81, 100, 121, 
                           144, 169, 196, 225, 256, 
                           289, 324, 361, 400, 441, 
                           484, 529, 576, 625, 676, 
                           729, 784, 841, 900, 961]
# Data Structure: Hash
#Algorithm
  # - initialize a hash containing n key:value pairs
    # - set each key to n+1 and each value to false
  # - loop n times
    # - on each loop, run a flip flop logic on all values whose keys are multiples of current n+1
      # - flip flop logic... if true ? false : true


