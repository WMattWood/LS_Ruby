# Each UUID consists of 32 hexadecimal characters, and is typically broken into 
# 5 sections like this 8-4-4-4-12 and represented as a string.
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# Write a method that returns one UUID when called with no parameters.

def uuid_maker ()
  hex = "1234567890abcdef"
  form = "xxxxxxxx-xxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" 
  uuid_array = form.chars.map do |x|
    if x == 'x'
      x.replace hex.chars.sample
    else
      '-'
    end
  end
  uuid_array.join
end

def uuid_maker2 ()
  hex = []
  (0..9).each { |digit| hex << digit.to_s }
  ('a'..'f').each { |letter| hex << letter }
  
  uuid = ""
  sets = [8, 4, 4, 4, 4, 12]
  sets.each_with_index do |num, idx|
    num.times { uuid << hex.sample }
    if idx < sets.length - 1  
      uuid << '-'  
    end
  end
  uuid
end

p uuid_maker()
p uuid_maker2()