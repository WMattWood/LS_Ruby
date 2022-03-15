def prompt(msg)
  puts "==> #{msg}"
end

nums = []

prompt "Enter the 1st number:"
nums << gets.chomp.to_i
prompt "Enter the 2nd number:"
nums << gets.chomp.to_i
prompt "Enter the 3rd number:"
nums << gets.chomp.to_i
prompt "Enter the 4th number:"
nums << gets.chomp.to_i
prompt "Enter the 5th number:"
nums << gets.chomp.to_i
prompt "Enter the last number:"
nums << gets.chomp.to_i

if nums[(0..4)].include?(nums[5])
  prompt "The number #{nums[5]} appears in #{nums[(0..4)]}."
else
  prompt "The number #{nums[5]} does not appear in #{nums[(0..4)]}."
end



# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].