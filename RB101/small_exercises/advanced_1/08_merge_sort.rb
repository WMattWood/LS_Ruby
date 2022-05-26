def merge_sort(arr)
  return arr if arr.size == 1

  list1 = arr[0...arr.size / 2]
  list2 = arr[arr.size / 2...arr.size]

  list1 = merge_sort(list1)
  list2 = merge_sort(list2)
  
  return merge(list1, list2)
end

def merge(arr1, arr2)
  output = []

  while arr1.size > 0 && arr2.size > 0
    arr1[0] > arr2[0] ? output << arr2.shift : output << arr1.shift
  end

  while arr1.size > 0
    output << arr1.shift
  end

  while arr2.size > 0
    output << arr2.shift
  end
      
  output
end

# def merge(arr1, arr2)
#   output = []

#   while arr1.size > 0 && arr2.size > 0
#     arr1[0] > arr2[0] ? output << arr2.shift : output << arr1.shift
#   end

#   while arr1.size > 0
#     output << arr1.shift
#   end

#   while arr2.size > 0
#     output << arr2.shift
#   end
      
#   output
# end

# procedure mergesort( var a as array )
#    if ( n == 1 ) return a

#    var l1 as array = a[0] ... a[n/2]
#    var l2 as array = a[n/2+1] ... a[n]

#    l1 = mergesort( l1 )
#    l2 = mergesort( l2 )

#    return merge( l1, l2 )
# end procedure

# procedure merge( var a as array, var b as array )

#    var c as array
#    while ( a and b have elements )
#       if ( a[0] > b[0] )
#          add b[0] to the end of c
#          remove b[0] from b
#       else
#          add a[0] to the end of c
#          remove a[0] from a
#       end if
#    end while
   
#    while ( a has elements )
#       add a[0] to the end of c
#       remove a[0] from a
#    end while
   
#    while ( b has elements )
#       add b[0] to the end of c
#       remove b[0] from b
#    end while
   
#    return c
	
# end procedure

# Input: an array of integers or strings
# Output: a sorted array of those integers or strings.
# Examples:
p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
# Data Structure: We are required to use the 'merge sort' algorithm
# ALGORITHM:
  # - split the input array into two sub arrays
  # - split the two sub arrays into two sub arrays
