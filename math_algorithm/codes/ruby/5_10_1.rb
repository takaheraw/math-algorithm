a, b, c = gets.split.map(&:to_i)

if Math.sqrt(a) + Math.sqrt(b) < Math.sqrt(c)
  puts 'Yes'
else
  puts 'No'
end
