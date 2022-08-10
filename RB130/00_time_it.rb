def time_it
  time_before = Time.now
  yield
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { puts "Banana" }
time_it { 1000.times do puts "Banana" end }