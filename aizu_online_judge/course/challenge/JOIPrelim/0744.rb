a, b = gets.split.map(&:to_i)

days_after = 7 * b
result_day = a + days_after

if result_day >= 1 && result_day <= 30
  puts 1
else
  puts 0
end
