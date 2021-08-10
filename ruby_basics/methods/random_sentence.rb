names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

# original solution.  I found the use of argument/variable names to be a little 
# confusing, so I included another slightly more simplified version below.
def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end

def sentence(name, activities)
  "#{name} is #{activities} to the store."
end

puts sentence(name(names), activity(activities))

# playing around with namespace for variables.  I suspected there would be no issues
# because of method definitions self contained with respect to local variables. 
def name(input)
  input.sample
end

def activity(input)
  input.sample
end

def sentence(word1, word2)
  "#{word1} is #{word2} to the store."
end

puts sentence(name(names), activity(activities))
