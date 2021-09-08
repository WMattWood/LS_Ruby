# Like every other thing in Ruby, boolean objects have classes behind them, and you can
# call methods on true and false objects.

# true.class                  # => TrueClass
# true.nil?                   # => false
# true.to_s                   # => 'true'
# true.methods                # => a list of all the methods you can call on the true object

# false.class                  # => FalseClass
# false.nil?                   # => false
# false.to_s                   # => 'false'
# false.methods                # => a list of all the methods you can call on the false object

(5 < 10).class