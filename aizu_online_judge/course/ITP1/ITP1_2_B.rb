# Ruby program to check if a < b < c

a, b, c = gets.split.map(&:to_i)

if a < b && b < c
  puts "Yes"
else
  puts "No"
end
