X = gets.to_i

day_after_x = X % 7

if day_after_x == 2
  puts 1
else
  puts 0
end
