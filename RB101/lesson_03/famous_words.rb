famous_words = "seven years ago..."

one_way = famous_words.prepend("Four score and ")
puts one_way

less_famous_words = "Four score and "
another_way = less_famous_words.concat(famous_words)