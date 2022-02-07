def print_in_box(phrase)
  fill = ''
  phrase.length.times do 
    fill << "-"
  end

  space = ''
  phrase.length.times do 
    space << " "
  end

  puts "+-" + fill + "-+"
  puts "| " + space + " |"
  puts "| " + phrase + " |"
  puts "| " + space + " |"
  puts "+-" + fill + "-+"

end


print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('Free Chalupas on Wednesdays!!!')
# +--------------------------------+
# |                                |
# | Free Chulupas on Wednesdays!!! |
# |                                |
# +--------------------------------+