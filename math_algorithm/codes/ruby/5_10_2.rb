a, b, c = gets.split.map(&:to_i)

if c - a - b < 0
  puts 'No'
elsif 4 * a * b < (c - a - b) * (c - a - b)
  puts 'Yes'
else
  puts 'No'
end
