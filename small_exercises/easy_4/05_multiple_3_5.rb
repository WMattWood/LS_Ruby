def sum_three_five(num)
  counter = 0
  arr_to_sum = []
  until counter == num do
    counter += 1
    if counter % 3 == 0 || counter % 5 == 0
      arr_to_sum << counter
    end
  end

  arr_to_sum.reduce(:+)
end

p sum_three_five(3) == 3
p sum_three_five(5) == 8
p sum_three_five(10) == 33
p sum_three_five(1000) == 234168