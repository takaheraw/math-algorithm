n = gets.to_i
times = gets.split.map(&:to_i)

n.times do |i|
  my_time = times[i]
  
  better_count = times.count { |time| time < my_time }
  
  rank = better_count + 1
  
  puts rank
end
