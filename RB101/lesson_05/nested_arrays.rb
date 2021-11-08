arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

# A selection of 'selections' ...how to access values inside a nested array structure.
arr[0]              # => ["a", ["b"]]
arr[0][1][0]        # => "b"
arr[1]              # => { :b => "bear", :c => "cat" }
arr[1][:b]          # => "bear"
arr[1][:b][0]       # => "b"
arr[2][2]           # => "b"