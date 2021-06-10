arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.push(11)    # append an 11
arr.unshift(0)  # prepend a 0

p arr           # prints arr

arr.pop         # remove 11 (the last item) from the array.  
                # no argument required for a single value... 
                # ...but optional argument will pop off more than one item.
arr.push(3)     # appends a 3 to the end of the array.

p arr           # prints arr