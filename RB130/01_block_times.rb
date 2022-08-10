def times(numbah)
  counter = 0
  while counter < numbah do
    yield (counter)
    counter +=1
  end

  numbah
end

times(5) do |num|
  puts num
end