# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

# SOLUTION:
#
# input: string
# output: new string (not the same object)
# rules:
#     Explicit requirements:
#       - all palindromes must be capitalized
#       - palindromes are case sensitive (ie. 'Dad' is not a palindrome, 'dad' is.)

#     Implicit requirements:
#       - the returned string shouldn't be the same object.
#       - if input is an empty string, the result should be an empty string.
