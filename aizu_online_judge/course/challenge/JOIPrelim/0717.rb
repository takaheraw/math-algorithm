n, k = gets.split.map(&:to_i)
s = gets.chomp

red_count = s.count('R')

if red_count == k
  puts 'W'
else
  puts 'R'
end
