raw_lines = File.foreach('FIFA Cardiac Deaths.txt').map { |line| line.chomp }

hashtable = Hash.new

raw_lines.each do |line|
    year = line[/\d{4}/]
    if hashtable.has_key?(year)
        hashtable[year] += 1
    else
        hashtable[year] = 1
    end
end

puts hashtable

# input - raw text file
# output - a hash containing all unique years and the number of times each of those years occurs in the text file

# - import the raw text file, and parse each line to a new element of an array raw_lines
# - iterate through each element of raw_lines
# - check if the element contains a 4 digit number, 
# - if a 4 digit number is present, assign that number to the variable year
# - check if the hash hashtable contains a key with the value of that year
    # - if the hash does not contain a key with the value of that year, add it as a key to the hash and add 1 to the value for that key
    # - if the hash already contains a key with the value of that year, add 1 to the value for that key.
# - print the hash to the console.