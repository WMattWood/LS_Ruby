printout = File.foreach('bin_output').map { |line| line.chomp }

printout.each do |number|
  number[0]